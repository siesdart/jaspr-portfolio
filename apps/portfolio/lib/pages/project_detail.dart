import 'package:common/common.dart';
import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/providers/config.dart';

class ProjectDetailPage extends StatelessComponent {
  const ProjectDetailPage(this.project, {super.key});

  final Project project;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;
    yield Head(
      title: '${project.title} - ${config.title}',
      meta: {
        'description': project.introduction,
        'keywords': project.tags.join(', '),
        'og:title': '${project.title} - ${config.title}',
        'og:description': project.introduction,
        'og:url': '${config.url}${context.binding.currentUri}',
      },
    );

    yield article(
      classes: 'prose leading-5 max-w-full lg:leading-6',
      [
        div(
          classes: 'not-prose flex items-center gap-1',
          [
            svg(
              classes: 'size-2 lg:size-3',
              styles: Styles.raw({'fill': '#${project.color}'}),
              viewBox: '0 0 16 16',
              [circle([], cx: '8', cy: '8', r: '8')],
            ),
            h4(
              classes: 'font-medium text-lg lg:text-xl',
              [text(project.title)],
            ),
            a(
              classes: project.repo == null ? 'pointer-events-none' : '',
              [
                svg(
                  classes:
                      'size-5 lg:size-6 ${project.repo == null ? 'fill-gray-400' : 'fill-slate-900'}',
                  viewBox: '0 0 24 24',
                  SvgIcons.github,
                ),
              ],
              href: 'https://github.com/${project.repo}',
              target: Target.blank,
            ),
            if (project.repo != null)
              img(
                src:
                    'https://img.shields.io/github/stars/${project.repo}?style=flat',
                alt: 'github stars',
                loading: MediaLoading.lazy,
              ),
            div(classes: 'flex-1', []),
            small([text(project.year.toString())]),
          ],
        ),
        h5(classes: 'font-light', [text(project.introduction)]),
        if (project.image != null)
          img(
            classes: 'max-h-96 mx-auto',
            src: project.image!,
            alt: '${project.title} image',
            loading: MediaLoading.lazy,
          ),
        p([text(project.description)]),
        span(
          classes: 'font-extralight',
          project.tags.map((tag) => text('#$tag ')).toList(),
        ),
      ],
    );
    yield Link(
      classes: 'mx-auto text-gray-600',
      to: '/projects',
      child: text('목록 보기'),
    );
  }
}
