FROM dart:stable as build

# Setup Tailwind CSS
RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
RUN chmod +x tailwindcss-linux-x64
RUN mv tailwindcss-linux-x64 /usr/local/bin/tailwindcss

WORKDIR /app
COPY . .

# Install Dependencies
RUN dart pub get
RUN dart pub global activate jaspr_cli

# Build Jaspr
RUN jaspr build

FROM pierrezemb/gostatic

COPY --from=build /app/build/jaspr/ /srv/http/