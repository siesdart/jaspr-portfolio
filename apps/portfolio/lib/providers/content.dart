import 'dart:convert';

import 'package:core/core.dart'
    show Experience, ExperienceMapper, Project, ProjectMapper;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

@Import.onServer('dart:io', show: [#Directory, #File])
import 'content.imports.dart';

final introductionProvider = FutureProvider<String>(
  (ref) async {
    final file = File(p.join('content', 'introduction.md'));
    return file.readAsString();
  },
);

final skillProvider = FutureProvider<String>(
  (ref) async {
    final file = File(p.join('content', 'skill.md'));
    return file.readAsString();
  },
);

final experiencesProvider = FutureProvider<List<Experience>>(
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
);

final projectsProvider = FutureProvider<List<Project>>(
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
);
