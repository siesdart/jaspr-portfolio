import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/pages/projects/detail/components/article.dart';
import 'package:portfolio/providers/config.dart';
import 'package:ui/ui.dart';

class ProjectDetailPage extends StatelessComponent {
  const ProjectDetailPage(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final title = '${project.title} | ${config.title}';

    return .fragment([
      Document.head(
        title: title,
        meta: {
          'description': project.introduction,
          'keywords': project.tags.join(', '),
          'robots': 'noindex, follow',
        },
        children: [
          link(
            id: 'canonical',
            rel: 'canonical',
            href: '${config.url}${context.url}',
          ),
          meta(
            id: 'og-title',
            attributes: {'property': 'og:title', 'content': title},
          ),
          meta(
            id: 'og-description',
            attributes: {
              'property': 'og:description',
              'content': project.introduction,
            },
          ),
          meta(
            id: 'og-url',
            attributes: {
              'property': 'og:url',
              'content': '${config.url}${context.url}',
            },
          ),
        ],
      ),
      ProjectArticle(project: project),
      nav(classes: 'flex justify-center', [
        Link(
          classes: buttonVariants(
            variant: ButtonVariant.ghost,
            size: ButtonSize.large,
          ),
          to: '/projects',
          children: const [Icon('chevron-left'), .text('목록으로')],
        ),
      ]),
    ]);
  }
}
