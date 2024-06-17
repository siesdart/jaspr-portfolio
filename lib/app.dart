import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/components/aside.dart';
import 'package:portfolio/components/footer.dart';
import 'package:portfolio/components/header.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/project.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class App extends StatelessComponent with SyncProviderDependencies {
  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies =>
      [configProvider, introductionProvider, projectsProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;

    yield h1(classes: 'sr-only', [text(config.title)]);
    yield Header();
    yield DomComponent(
      tag: 'main',
      classes:
          'grid grid-cols-1 place-items-center min-h-64 my-4 px-6 lg:grid-cols-[14rem_auto] lg:place-items-start lg:gap-x-8 lg:my-8 lg:px-8',
      children: [
        Aside(),
        div(
          classes:
              'max-w-screen-sm w-full flex flex-col gap-6 mt-4 lg:max-w-screen-md lg:col-start-2 lg:mt-0 lg:mx-auto',
          [
            Router(
              routes: [
                Route(path: '/', builder: (context, state) => const Home()),
                if (context.watch(projectsProvider)
                    case AsyncData(:final value))
                  for (final project in value)
                    Route(
                      path: '/projects/${project.id}',
                      builder: (context, state) => Project(project),
                    ),
              ],
            ),
          ],
        ),
      ],
    );
    yield Footer();
  }
}
