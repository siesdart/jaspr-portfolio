import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/components/aside.dart';
import 'package:portfolio/components/footer.dart';
import 'package:portfolio/components/header.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/project_detail.dart';
import 'package:portfolio/pages/project_list.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class App extends StatelessComponent with SyncProviderDependencies {
  const App({super.key});

  @override
  Iterable<SyncProvider<dynamic>> get preloadDependencies => [projectsProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;

    yield h1(classes: 'sr-only', [text(config.title)]);
    yield const Header();
    yield main_(
      classes:
          'grid grid-cols-1 place-items-center min-h-80 mt-1 mb-4 px-6 lg:grid-cols-[14rem_auto] lg:place-items-start lg:gap-x-8 lg:my-8 lg:px-8',
      [
        const Aside(),
        div(
          classes:
              'max-w-screen-sm w-full flex flex-col gap-6 mt-4 lg:max-w-screen-md lg:col-start-2 lg:mt-0 lg:mx-auto',
          [
            Router(
              routes: [
                Route(
                  path: '/',
                  settings: const RouteSettings(priority: 1),
                  builder: (context, state) => const HomePage(),
                ),
                Route(
                  path: '/projects',
                  settings: const RouteSettings(priority: 0.7),
                  builder: (context, state) => const ProjectListPage(),
                ),
                if (context.watch(projectsProvider)
                    case AsyncData(value: final projects))
                  for (final project in projects)
                    Route(
                      path: '/projects/${project.id}',
                      builder: (context, state) => ProjectDetailPage(project),
                    ),
              ],
            ),
          ],
        ),
      ],
    );
    yield const Footer();
  }
}
