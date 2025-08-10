import 'package:core/core.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

final configProvider = SyncProvider<Config>(
  (ref) => throw UnimplementedError(),
  id: 'config',
);
