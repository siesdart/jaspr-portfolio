import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart' hide File;
import 'package:github/github.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:portfolio/service_locator.dart';
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
final FutureProvider<List<Opensource>> opensourceProvider =
    createDirectoryProvider('opensources', (json) async {
      final opensource = OpensourceMapper.fromJson(json);
      if (opensource.contribution != null) {
        final github = getIt<GitHub>();

        for (var i = 0; i < opensource.contribution!.length; i++) {
          final contribution = opensource.contribution![i];
          if (contribution.title == null) {
            final pr = await github.pullRequests.get(
              RepositorySlug.full(opensource.repo),
              contribution.id,
            );
            opensource.contribution![i] = contribution.copyWith(
              title: pr.title,
            );
          }
        }
      }
      return opensource;
    });

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
  FutureOr<T> Function(String) mapper,
) {
  return FutureProvider<List<T>>(
    (ref) async {
      return Directory(p.join('content', directoryPath))
          .list()
          .where((e) => e is File)
          .asyncMap(
            (e) async => await mapper(
              json.encode(loadYaml(await (e as File).readAsString())),
            ),
          )
          .toList();
    },
  );
}
