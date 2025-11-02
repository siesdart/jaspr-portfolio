import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ui/ui.dart';

class ProjectItem extends StatelessComponent {
  const ProjectItem(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    return Link(
      to: 'projects/${project.id}',
      children: [
        ListItem(
          children: [
            h5(
              classes: 'font-medium',
              [text(project.title)],
            ),
            p(classes: 'font-light', [text(project.introduction)]),
            span(
              classes: 'font-extralight text-gray-600',
              project.tags.map((tag) => text('#$tag ')).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
