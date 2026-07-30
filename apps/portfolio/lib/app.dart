import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/components/aside.dart';
import 'package:portfolio/components/footer.dart';
import 'package:portfolio/components/header.dart';
import 'package:portfolio/components/navbar.dart';
import 'package:portfolio/pages/home/home.dart';
import 'package:portfolio/pages/projects/detail/project_detail.dart';
import 'package:portfolio/pages/projects/projects.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final content = context.watch(contentProvider);

    return .fragment([
      const a(
        href: '#main-content',
        classes:
            'sr-only focus:not-sr-only focus:absolute focus:top-3 focus:left-3 z-50 rounded-md bg-background px-4 py-2 text-foreground shadow-md focus:outline-none focus:ring-3 focus:ring-ring',
        [.text('본문으로 건너뛰기')],
      ),
      h1(classes: 'sr-only', [.text(config.title)]),
      const Navbar(),
      const Header(),
      main_(
        id: 'main-content',
        classes:
            'grid grid-cols-1 place-items-center min-h-80 mt-1 mb-4 px-6 lg:grid-cols-[14rem_auto] lg:place-items-start lg:gap-x-8 lg:my-8 lg:px-8',
        [
          const Aside(),
          div(
            classes:
                'max-w-3xl w-full flex flex-col gap-8 mt-4 lg:max-w-4xl lg:col-start-2 lg:mt-0 lg:mx-auto',
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
                    builder: (context, state) => const ProjectsPage(),
                  ),
                  for (final project in content.projects)
                    Route(
                      path: '/projects/${project.id}',
                      builder: (context, state) => ProjectDetailPage(project),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
      const Footer(),
      const script(src: 'https://unpkg.com/lucide@latest'),
      const script(content: 'lucide.createIcons();'),
    ]);
  }
}
