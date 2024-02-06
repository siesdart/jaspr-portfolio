import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/main.init.dart';

class MapperCodec<T> extends Codec<T, String> {
  MapperCodec() {
    initializeMappers();
  }

  @override
  Converter<String, T> get decoder =>
      SimpleConverter(MapperContainer.globals.fromJson);

  @override
  Converter<T, String> get encoder =>
      SimpleConverter(MapperContainer.globals.toJson);
}
