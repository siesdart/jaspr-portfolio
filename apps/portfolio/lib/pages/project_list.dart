import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/project/project_list_item.dart';
import 'package:portfolio/providers/content.dart';

class ProjectListPage extends StatelessComponent with SyncProviderDependencies {
  const ProjectListPage({super.key});

  @override
  Iterable<SyncProvider<dynamic>> get preloadDependencies => [projectsProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        yield ul(
          classes: 'divide-y divide-gray-200',
          projects.sortedByYearAndOrder().map(ProjectListItem.new).toList(),
        );
    }
  }
}
