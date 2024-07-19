FROM dart:stable as build

# Setup Tailwind CSS
RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
RUN chmod +x tailwindcss-linux-x64
RUN mv tailwindcss-linux-x64 /usr/local/bin/tailwindcss

WORKDIR /app
COPY . .

# Install Dependencies
RUN dart pub global activate melos
RUN dart pub global activate jaspr_cli
RUN melos bootstrap

# Build Jaspr
WORKDIR /app/apps/portfolio
RUN jaspr build

FROM pierrezemb/gostatic

COPY --from=build /app/apps/portfolio/build/jaspr/ /srv/http/