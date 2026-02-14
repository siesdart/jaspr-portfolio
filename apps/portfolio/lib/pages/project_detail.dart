import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/providers/config.dart';
import 'package:ui/ui.dart';

class ProjectDetailPage extends StatelessComponent {
  const ProjectDetailPage(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    return Component.fragment([
      Document.head(
        title: '${project.title} - ${config.title}',
        meta: {
          'description': project.introduction,
          'keywords': project.tags.join(', '),
          'og:title': '${project.title} - ${config.title}',
          'og:description': project.introduction,
          'og:url': '${config.url}${context.url}',
        },
      ),
      article(
        classes: 'prose flex flex-col gap-1 max-w-full',
        [
          div(
            classes: 'not-prose flex items-center gap-2',
            [
              svg(
                classes: 'size-3',
                styles: Styles(raw: {'fill': '#${project.color}'}),
                viewBox: '0 0 16 16',
                const [circle(cx: '8', cy: '8', r: '8', [])],
              ),
              h4(
                classes: 'font-medium text-lg',
                [Component.text(project.title)],
              ),
              a(
                classes: cn([
                  {'pointer-events-none': project.repo == null},
                ]),
                href: 'https://github.com/${project.repo}',
                target: Target.blank,
                [
                  Icon(
                    'github',
                    classes: cn([
                      'size-6',
                      if (project.repo == null)
                        'fill-gray-400'
                      else
                        'fill-slate-900',
                    ]),
                  ),
                ],
              ),
              if (project.repo != null)
                img(
                  src:
                      'https://img.shields.io/github/stars/${project.repo}?style=flat',
                  alt: 'github stars',
                  loading: MediaLoading.lazy,
                ),
              const div(classes: 'flex-1', []),
              span(classes: 'font-light text-sm', [
                Component.text(project.year.toString()),
              ]),
            ],
          ),
          h5(classes: 'font-light text-sm', [
            Component.text(project.introduction),
          ]),
          if (project.files != null && project.files!.isNotEmpty)
            div(
              classes: 'not-prose flex flex-row-reverse gap-2',
              project.files!.reversed
                  .map(
                    (file) => a(
                      classes: 'flex items-center gap-1 text-sm',
                      href: file.src,
                      target: Target.blank,
                      [
                        const Icon(
                          'paperclip',
                          classes: 'size-5 fill-none stroke-slate-900',
                        ),
                        Component.text(file.name),
                      ],
                    ),
                  )
                  .toList(),
            ),
          if (project.image != null)
            img(
              classes: 'max-h-96 mx-auto',
              src: project.image!,
              alt: '${project.title} image',
              loading: MediaLoading.lazy,
            ),
          MarkdownArticle(content: project.content),
          span(
            classes: 'font-extralight text-gray-600',
            project.tags.map((tag) => Component.text('#$tag ')).toList(),
          ),
        ],
      ),
      Link(
        classes: buttonVariants(variant: ButtonVariant.ghost),
        to: '/projects',
        child: const Component.text('목록으로'),
      ),
    ]);
  }
}
