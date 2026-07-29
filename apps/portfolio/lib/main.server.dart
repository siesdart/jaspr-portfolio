import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/config.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';
import 'package:portfolio/service_locator.dart';

import 'main.server.options.dart';

void main() async {
  Jaspr.initializeApp(options: defaultServerOptions);
  configureDependencies();
  initializeMappers();

  final config = await loadConfigFile();

  runApp(
    Document(
      title: config.title,
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
          attributes: {'property': 'og:site_name', 'content': config.title},
        ),
        meta(
          id: 'og-locale',
          attributes: {'property': 'og:locale', 'content': config.locale},
        ),
        const meta(
          id: 'og-type',
          attributes: {'property': 'og:type', 'content': 'website'},
        ),
      ],
      lang: config.locale.split('_')[0],
      meta: {
        'description': config.description,
        'robots': 'index, follow',
        'twitter:card': 'summary',
      },
      body: Builder(
        builder: (context) => ProviderScope(
          overrides: [configProvider.overrideWith((ref) => config)],
          sync: [
            introductionProvider.syncWith('introduction'),
            skillProvider.syncWith('skill'),
            careersProvider.syncWith('careers'),
            projectsProvider.syncWith('projects'),
            opensourcesProvider.syncWith('opensources'),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
