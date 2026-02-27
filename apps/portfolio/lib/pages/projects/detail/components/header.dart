import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class ProjectHeader extends StatelessComponent {
  const ProjectHeader({required this.project, super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    return header(
      classes: 'not-prose flex flex-col gap-1',
      [
        div(
          classes: 'flex items-center gap-2',
          [
            svg(
              classes: 'size-3 shrink-0',
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
                'transition-opacity hover:opacity-80',
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
                      'fill-muted-foreground'
                    else
                      'fill-foreground',
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
      ],
    );
  }
}
