import 'dart:convert';

import 'package:common/common.init.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

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
