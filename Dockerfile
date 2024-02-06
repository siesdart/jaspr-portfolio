# FROM dart:stable as build

# WORKDIR /app
# COPY . .
# RUN dart pub get
# RUN dart pub global activate jaspr_cli
# RUN jaspr generate

# FROM pierrezemb/gostatic
# COPY --from=build /app/build/jaspr/ /srv/http/

FROM pierrezemb/gostatic
COPY ./build/jaspr/ /srv/http/