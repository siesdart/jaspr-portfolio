import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:github/github.dart';
import 'package:portfolio/service_locator.dart';
import 'package:yaml/yaml.dart';

Future<Config> loadConfigFile() async {
  final doc = await File('config.yaml').readAsString();
  final config = ConfigMapper.fromJson(json.encode(loadYaml(doc)));
  final github = getIt<GitHub>();
  return config.copyWith(
    opensource: await Future.wait(
      config.opensource.map(
        (opensource) async => opensource.contribution != null
            ? opensource.copyWith(
                contribution: await Future.wait(
                  opensource.contribution!.map(
                    (contribution) async {
                      if (contribution.title == null) {
                        final pr = await github.pullRequests.get(
                          RepositorySlug.full(opensource.repo),
                          contribution.id,
                        );
                        return contribution.copyWith(title: pr.title);
                      }
                      return contribution;
                    },
                  ),
                ),
              )
            : opensource,
      ),
    ),
  );
}
