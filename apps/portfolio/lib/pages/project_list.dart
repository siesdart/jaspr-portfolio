import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/project/project_list_item.dart';
import 'package:portfolio/providers/content.dart';

class ProjectListPage extends StatelessComponent {
  const ProjectListPage({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        return ul(
          projects.sortedByYearAndOrder().map(ProjectListItem.new).toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
