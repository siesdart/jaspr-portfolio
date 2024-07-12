import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/project.dart';

class ProjectListItem extends StatelessComponent {
  final Project project;

  const ProjectListItem(this.project);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex flex-col py-3', [
      a(
        [
          div(classes: 'flex items-center gap-2', [
            svg(
              classes: 'size-1 lg:size-2',
              styles: Styles.raw({'fill': '#${project.color}'}),
              viewBox: '0 0 16 16',
              [circle([], cx: '8', cy: '8', r: '8')],
            ),
            h5(classes: 'font-medium', [text(project.title)]),
            div(classes: 'flex-1', []),
            small([text(project.year.toString())]),
          ]),
          p(classes: 'font-light', [text(project.introduction)]),
          span(
            classes: 'font-extralight',
            [text(project.tags.map((tag) => '#$tag').join(' '))],
          ),
        ],
        href: 'projects/${project.id}',
      ),
    ]);
  }
}
