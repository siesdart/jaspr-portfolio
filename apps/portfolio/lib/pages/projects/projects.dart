import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/projects/components/project_item.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class ProjectsPage extends StatelessComponent {
  const ProjectsPage({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final content = context.watch(contentProvider);
    final title = 'Projects | ${config.title}';

    return .fragment([
      Document.head(
        title: title,
        meta: {'robots': 'noindex, follow'},
        children: [
          link(
            id: 'canonical',
            rel: 'canonical',
            href: '${config.url}/projects',
          ),
          meta(
            id: 'og-title',
            attributes: {'property': 'og:title', 'content': title},
          ),
          meta(
            id: 'og-description',
            attributes: {
              'property': 'og:description',
              'content': config.description,
            },
          ),
          meta(
            id: 'og-url',
            attributes: {
              'property': 'og:url',
              'content': '${config.url}/projects',
            },
          ),
        ],
      ),
      ul(content.projects.map(ProjectItem.new).toList()),
    ]);
  }
}
