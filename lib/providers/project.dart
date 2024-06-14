import 'dart:convert';
import 'dart:io';

import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/utils/codec.dart';
import 'package:yaml/yaml.dart';

final projectsProvider = SyncProvider<List<Project>>(
  (ref) async {
    return Directory('content/projects')
        .list()
        .where((e) => e is File)
        .asyncMap((e) async => ProjectMapper.fromJson(
            json.encode(loadYaml(await (e as File).readAsString()))))
        .toList();
  },
  id: 'projects',
  codec: MapperCodec(),
);
