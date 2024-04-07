@MappableLib(generateInitializerForScope: InitializerScope.package)
library main;

import 'dart:convert';
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/jaspr_options.dart';
import 'package:portfolio/main.init.dart';
import 'package:portfolio/models/config.dart';
import 'package:portfolio/providers/config.dart';
import 'package:yaml/yaml.dart';

Future<Config> loadConfigFile() async {
  final doc = await File('config.yaml').readAsString();
  return ConfigMapper.fromJson(json.encode(loadYaml(doc)));
}

void main() async {
  Jaspr.initializeApp(options: defaultJasprOptions);
  initializeMappers();

  final config = await loadConfigFile();

  runApp(Document(
    title: config.title,
    head: [link(href: 'styles.css', rel: 'stylesheet')],
    meta: {
      'description': config.description,
      'robots': 'index, follow',
      'og:site_name': config.title,
      'og:locale': config.locale,
      'og:title': config.title,
      'og:description': config.description,
      'og:type': 'website',
      'og:url': config.url,
    },
    styles: const [
      StyleRule.import(
        'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap',
      ),
    ],
    body: Builder.single(
      builder: (context) => ProviderScope(
        overrides: [configProvider.overrideWith((ref) => config)],
        child: App(),
      ),
    ),
  ));
}
