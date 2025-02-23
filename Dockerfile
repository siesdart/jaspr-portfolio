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
RUN melos build

FROM pierrezemb/gostatic

COPY --from=build /app/apps/portfolio/build/jaspr/ /srv/http/