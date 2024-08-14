import 'package:common/common.dart';
import 'package:jaspr/jaspr.dart';

class ProjectListItem extends StatelessComponent {
  const ProjectListItem(this.project, {super.key});

  final Project project;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li([
      a(
        classes: 'flex flex-col my-3',
        [
          div(classes: 'flex items-center gap-2', [
            svg(
              classes: 'size-2',
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
            project.tags.map((tag) => text('#$tag ')).toList(),
          ),
        ],
        href: 'projects/${project.id}',
      ),
    ]);
  }
}
