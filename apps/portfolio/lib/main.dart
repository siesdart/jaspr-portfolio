import 'package:core/core.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/config.dart';
import 'package:portfolio/jaspr_options.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';
import 'package:portfolio/service_locator.dart';

void main() async {
  Jaspr.initializeApp(options: defaultJasprOptions);
  setupLocator();
  initializeMappers();

  final config = await loadConfigFile();

  runApp(
    Document(
      title: config.title,
      head: [
        ...['100', '200', '300', 'regular', '500', '600', '700'].map(
          (weight) => link(
            rel: 'preload',
            href: '/fonts/ibm-plex-sans-kr-v10-korean_latin-$weight.woff2',
            as: 'font',
            type: 'font/woff2',
            attributes: {'crossorigin': ''},
          ),
        ),
        link(href: 'styles.css', rel: 'stylesheet'),
      ],
      lang: config.locale.split('_')[0],
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
      body: Builder(
        builder: (context) => ProviderScope(
          overrides: [configProvider.overrideWith((ref) => config)],
          sync: [
            introductionProvider.syncWith('introduction'),
            skillProvider.syncWith('skill'),
            experiencesProvider.syncWith('experiences'),
            projectsProvider.syncWith('projects'),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
