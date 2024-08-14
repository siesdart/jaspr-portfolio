import 'package:common/common.dart';
import 'package:jaspr/jaspr.dart';

class ProjectItem extends StatelessComponent {
  const ProjectItem(this.project, {super.key});

  final Project project;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex flex-col items-start', [
      a(
        classes: 'font-medium',
        [
          h5([text(project.title)]),
        ],
        href: 'projects/${project.id}',
      ),
      p(classes: 'font-light', [text(project.introduction)]),
      span(
        classes: 'font-extralight',
        project.tags.map((tag) => text('#$tag ')).toList(),
      ),
    ]);
  }
}
