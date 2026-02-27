import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/tags.dart';
import 'package:portfolio/pages/projects/detail/components/attachments.dart';
import 'package:portfolio/pages/projects/detail/components/header.dart';
import 'package:portfolio/providers/config.dart';
import 'package:ui/ui.dart';

class ProjectDetailPage extends StatelessComponent {
  const ProjectDetailPage(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final title = '${project.title} - ${config.title}';

    return Component.fragment([
      Document.head(
        title: title,
        meta: {
          'description': project.introduction,
          'keywords': project.tags.join(', '),
          'og:title': title,
          'og:description': project.introduction,
          'og:url': '${config.url}${context.url}',
        },
      ),
      article(
        classes: 'prose flex flex-col gap-2 max-w-full',
        [
          ProjectHeader(project: project),
          if (project.files != null && project.files!.isNotEmpty)
            ProjectAttachments(files: project.files!),
          if (project.image != null)
            figure(
              [
                img(
                  classes: 'max-h-96 w-full object-contain',
                  src: project.image!,
                  alt: '${project.title} image',
                  loading: MediaLoading.lazy,
                ),
              ],
            ),
          MarkdownArticle(content: project.content),
          Tags(classes: 'not-prose', project.tags),
        ],
      ),
      nav(
        classes: 'flex justify-center',
        [
          Link(
            classes: buttonVariants(variant: ButtonVariant.ghost),
            to: '/projects',
            children: const [Icon('chevron-left'), Component.text('목록으로')],
          ),
        ],
      ),
    ]);
  }
}
