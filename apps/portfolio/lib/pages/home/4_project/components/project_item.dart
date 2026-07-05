import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/tags.dart';
import 'package:ui/ui.dart';

class ProjectItem extends StatelessComponent {
  const ProjectItem(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    return ListItem(
      to: 'projects/${project.id}',
      children: [
        h3(classes: 'font-medium', [.text(project.title)]),
        p(classes: 'font-light', [.text(project.introduction)]),
        Tags(classes: 'mt-1', project.tags),
      ],
    );
  }
}
