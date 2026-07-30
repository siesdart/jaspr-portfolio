import 'dart:io' as io;

import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/app_data/app_bootstrap_loader.dart';
import 'package:portfolio/config.dart';
import 'package:portfolio/content.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';
import 'package:portfolio/service_locator.dart';

import 'main.server.options.dart';

void main() async {
  Jaspr.initializeApp(options: defaultServerOptions);
  configureDependencies();
  initializeMappers();

  final appData = await AppBootstrapLoader(
    configLoader: ConfigFileLoader(io.File('config.yaml')),
    contentLoader: ContentDirectoryLoader(io.Directory('content')),
  ).load();

  runApp(
    Document(
      title: appData.config.title,
      head: [
        ...['regular', '700'].map(
          (weight) => link(
            rel: 'preload',
            href: '/fonts/ibm-plex-sans-kr-v10-korean_latin-$weight.woff2',
            as: 'font',
            type: 'font/woff2',
            attributes: const {'crossorigin': ''},
          ),
        ),
        const link(rel: 'preload', href: 'styles.css', as: 'style'),
        const link(rel: 'stylesheet', href: 'styles.css'),
        meta(
          id: 'og-site-name',
          attributes: {
            'property': 'og:site_name',
            'content': appData.config.title,
          },
        ),
        meta(
          id: 'og-locale',
          attributes: {
            'property': 'og:locale',
            'content': appData.config.locale,
          },
        ),
        const meta(
          id: 'og-type',
          attributes: {'property': 'og:type', 'content': 'website'},
        ),
      ],
      lang: appData.config.locale.split('_')[0],
      meta: {
        'description': appData.config.description,
        'robots': 'index, follow',
        'twitter:card': 'summary',
      },
      body: Builder(
        builder: (context) => ProviderScope(
          overrides: [
            configProvider.overrideWith((ref) => appData.config),
            contentProvider.overrideWith((ref) => appData.content),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
