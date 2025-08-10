import 'dart:convert';

import 'package:core/core.dart'
    show Experience, ExperienceMapper, Project, ProjectMapper;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

@Import.onServer('dart:io', show: [#Directory, #File])
import 'content.imports.dart';

final introductionProvider = SyncProvider<String>(
  (ref) async {
    final file = File(p.join('content', 'introduction.md'));
    return file.readAsString();
  },
  id: 'introduction',
);

final skillProvider = SyncProvider<String>(
  (ref) async {
    final file = File(p.join('content', 'skill.md'));
    return file.readAsString();
  },
  id: 'skill',
);

final experiencesProvider = SyncProvider<List<Experience>>(
  (ref) async {
    return Directory(p.join('content', 'experiences'))
        .list()
        .where((e) => e is File)
        .asyncMap(
          (e) async => ExperienceMapper.fromJson(
            json.encode(loadYaml(await (e as File).readAsString())),
          ),
        )
        .toList();
  },
  id: 'experiences',
);

final projectsProvider = SyncProvider<List<Project>>(
  (ref) async {
    return Directory(p.join('content', 'projects'))
        .list()
        .where((e) => e is File)
        .asyncMap(
          (e) async => ProjectMapper.fromJson(
            json.encode(loadYaml(await (e as File).readAsString())),
          ),
        )
        .toList();
  },
  id: 'projects',
);
