FROM dart:stable AS build

# Setup Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash
RUN apt-get install -y nodejs

WORKDIR /app
COPY . .

# Install Dependencies
RUN dart pub global activate melos
RUN dart pub global activate jaspr_cli
RUN melos bootstrap

# Build Jaspr
RUN --mount=type=secret,id=GITHUB_TOKEN \
    GITHUB_TOKEN="$(cat /run/secrets/GITHUB_TOKEN)" \
    melos build

# Keep build metadata and dependency sources out of the public static root.
RUN mkdir -p /runtime \
    && find apps/portfolio/build/jaspr -mindepth 1 -maxdepth 1 \
      ! -name '.build.manifest' \
      ! -name '.dart_tool' \
      ! -name 'packages' \
      ! -name 'styles.tw.css' \
      -exec cp -a {} /runtime/ +

FROM nginx:alpine

COPY --from=build /runtime/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
