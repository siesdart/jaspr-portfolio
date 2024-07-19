import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/models/config.dart';
import 'package:portfolio/utils/codec.dart';

final configProvider = SyncProvider<Config>(
  (ref) => throw UnimplementedError(),
  id: 'config',
  codec: MapperCodec(),
);
