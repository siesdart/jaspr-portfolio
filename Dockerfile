FROM dart:stable as build

# Setup Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash
RUN apt-get install -y nodejs

WORKDIR /app
COPY . .

# Install Dependencies
RUN dart pub get
RUN dart pub global activate jaspr_cli
RUN npm install

# Build Jaspr
RUN jaspr build

FROM pierrezemb/gostatic

COPY --from=build /app/build/jaspr/ /srv/http/