import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/projects/components/project_item.dart';
import 'package:portfolio/providers/content.dart';

class ProjectsPage extends StatelessComponent {
  const ProjectsPage({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        return ul(
          projects.sortedByYearAndOrder().map(ProjectItem.new).toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
