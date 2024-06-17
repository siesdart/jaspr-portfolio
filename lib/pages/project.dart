import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/project.dart' as model;

@client
class Project extends StatelessComponent {
  final model.Project project;

  const Project(this.project, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(
      classes: 'prose leading-5 max-w-full lg:leading-6',
      [
        div(
          classes: 'not-prose flex items-center gap-2',
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
                  [
                    path(
                      [],
                      d: 'M12 2C6.477 2 2 6.463 2 11.97c0 4.404 2.865 8.14 6.839 9.458.5.092.682-.216.682-.48 0-.236-.008-.864-.013-1.695-2.782.602-3.369-1.337-3.369-1.337-.454-1.151-1.11-1.458-1.11-1.458-.908-.618.069-.606.069-.606 1.003.07 1.531 1.027 1.531 1.027.892 1.524 2.341 1.084 2.91.828.092-.643.35-1.083.636-1.332-2.22-.251-4.555-1.107-4.555-4.927 0-1.088.39-1.979 1.029-2.675-.103-.252-.446-1.266.098-2.638 0 0 .84-.268 2.75 1.022A9.607 9.607 0 0 1 12 6.82c.85.004 1.705.114 2.504.336 1.909-1.29 2.747-1.022 2.747-1.022.546 1.372.202 2.386.1 2.638.64.696 1.028 1.587 1.028 2.675 0 3.83-2.339 4.673-4.566 4.92.359.307.678.915.678 1.846 0 1.332-.012 2.407-.012 2.734 0 .267.18.577.688.48 3.97-1.32 6.833-5.054 6.833-9.458C22 6.463 17.522 2 12 2Z',
                    ),
                  ],
                ),
              ],
              href: 'https://github.com/${project.repo}',
              target: Target.blank,
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
            alt: '${project.title} 이미지',
            loading: MediaLoading.lazy,
          ),
        p([text(project.description)]),
        span(
          classes: 'font-extralight',
          [text(project.tags.map((tag) => '#$tag').join(' '))],
        ),
      ],
    );
  }
}
