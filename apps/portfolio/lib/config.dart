import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart' show Config, ConfigMapper;
import 'package:github/github.dart';
import 'package:portfolio/service_locator.dart';
import 'package:yaml/yaml.dart';

Future<Config> loadConfigFile() async {
  final doc = await File('config.yaml').readAsString();
  final config = ConfigMapper.fromJson(json.encode(loadYaml(doc)));
  final github = getIt<GitHub>();

  for (final opensource in config.opensource) {
    if (opensource.contribution != null) {
      for (var i = 0; i < opensource.contribution!.length; i++) {
        final contribution = opensource.contribution![i];
        if (contribution.title == null) {
          final pr = await github.pullRequests.get(
            RepositorySlug.full(opensource.repo),
            contribution.id,
          );
          opensource.contribution![i] = contribution.copyWith(title: pr.title);
        }
      }
    }
  }

  return config;
}
