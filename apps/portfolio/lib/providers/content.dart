import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart' hide File;
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

final FutureProvider<String> introductionProvider = createFileProvider(
  'introduction.md',
);
final FutureProvider<String> skillProvider = createFileProvider('skill.md');
final FutureProvider<List<Experience>> experiencesProvider =
    createDirectoryProvider(
      'experiences',
      ExperienceMapper.fromJson,
    );
final FutureProvider<List<Project>> projectsProvider = createDirectoryProvider(
  'projects',
  ProjectMapper.fromJson,
);

FutureProvider<String> createFileProvider(String filename) {
  return FutureProvider<String>(
    (ref) async {
      final file = File(p.join('content', filename));
      return file.readAsString();
    },
  );
}

FutureProvider<List<T>> createDirectoryProvider<T>(
  String directoryPath,
  T Function(String) fromJson,
) {
  return FutureProvider<List<T>>(
    (ref) async {
      return Directory(p.join('content', directoryPath))
          .list()
          .where((e) => e is File)
          .asyncMap(
            (e) async => fromJson(
              json.encode(loadYaml(await (e as File).readAsString())),
            ),
          )
          .toList();
    },
  );
}
