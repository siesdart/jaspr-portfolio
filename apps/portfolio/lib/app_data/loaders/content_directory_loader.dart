import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:core/core.dart';
import 'package:fbh_front_matter/fbh_front_matter.dart' as fm;
import 'package:github/github.dart';
import 'package:path/path.dart' as p;
import 'package:portfolio/app_data/app_data_loader.dart';
import 'package:portfolio/app_data/app_data_source_exception.dart';
import 'package:portfolio/service_locator.dart';
import 'package:yaml/yaml.dart';

class ContentDirectoryLoader implements AppDataLoader<Content> {
  ContentDirectoryLoader(this.root);

  final io.Directory root;
  final GitHub _github = getIt<GitHub>();
  final Map<String, String> _titles = {};

  @override
  Future<Content> load() async {
    final introduction = await readFile(root, 'introduction.md');
    final skill = await readFile(root, 'skill.md');
    final careers = await readDirectory(
      root,
      'careers',
      CareerMapper.fromJson,
    );
    final projects = await readDirectory(
      root,
      'projects',
      ProjectMapper.fromJson,
    );
    final opensources = await readDirectory(
      root,
      'opensources',
      OpensourceMapper.fromJson,
    );

    final enrichedOpensources = await Future.wait(
      opensources.map(enrichOpensource),
    );

    return Content(
      introduction: introduction,
      skill: skill,
      careers: List.unmodifiable(careers.sortedByPeriod()),
      projects: List.unmodifiable(projects.sortedByYearAndOrder()),
      opensources: List.unmodifiable(enrichedOpensources.sortedByOrder()),
    );
  }

  Future<String> readFile(io.Directory root, String relativePath) async {
    final file = io.File(p.join(root.path, relativePath));
    try {
      return await file.readAsString();
    } on Object catch (error, stackTrace) {
      throw AppDataSourceException(relativePath, error, stackTrace);
    }
  }

  Future<List<T>> readDirectory<T>(
    io.Directory root,
    String directoryPath,
    T Function(String) mapper,
  ) async {
    final directory = io.Directory(p.join(root.path, directoryPath));
    try {
      final files = await directory
          .list()
          .where((entry) => entry is io.File)
          .cast<io.File>()
          .toList();
      final values = await Future.wait(
        files.map((file) async {
          try {
            final source = await file.readAsString();
            final json = switch (p.extension(file.path)) {
              '.yaml' => jsonEncode(loadYaml(source)),
              '.md' => () {
                final document = fm.parse(source);
                return jsonEncode({
                  ...document.data,
                  'content': document.content,
                });
              }(),
              _ => source,
            };
            return mapper(json);
          } on AppDataSourceException {
            rethrow;
          } on Object catch (error, stackTrace) {
            throw AppDataSourceException(
              p.relative(file.path, from: root.path),
              error,
              stackTrace,
            );
          }
        }),
      );
      return values;
    } on AppDataSourceException {
      rethrow;
    } on Object catch (error, stackTrace) {
      throw AppDataSourceException(directoryPath, error, stackTrace);
    }
  }

  Future<Opensource> enrichOpensource(Opensource opensource) async {
    final contributions = opensource.contribution;
    if (contributions == null) return opensource;

    final enriched = await Future.wait(
      contributions.map(
        (contribution) => enrichContribution(opensource.repo, contribution),
      ),
    );
    return opensource.copyWith(contribution: enriched);
  }

  Future<Contribution> enrichContribution(
    String repository,
    Contribution contribution,
  ) async {
    if (contribution.title != null) return contribution;

    final key = '$repository#${contribution.id}';

    try {
      final pullRequest = await _github.pullRequests
          .get(
            RepositorySlug.full(repository),
            contribution.id,
          )
          .timeout(const Duration(seconds: 3));
      final title = _titles[key] ??=
          pullRequest.title ?? (throw StateError('Pull request title missing'));
      return contribution.copyWith(title: title);
    } on Object {
      return contribution.copyWith(title: null);
    }
  }
}
