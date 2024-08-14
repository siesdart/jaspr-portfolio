import 'package:common/common.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ProjectItem extends StatelessComponent {
  const ProjectItem(this.project, {super.key});

  final Project project;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex flex-col items-start', [
      Link(
        classes: 'font-medium',
        to: 'projects/${project.id}',
        child: h5([text(project.title)]),
      ),
      p(classes: 'font-light', [text(project.introduction)]),
      span(
        classes: 'font-extralight',
        project.tags.map((tag) => text('#$tag ')).toList(),
      ),
    ]);
  }
}
