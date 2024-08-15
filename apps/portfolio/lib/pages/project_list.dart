import 'package:common/common.dart';
import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/content.dart';

class ProjectListPage extends StatelessComponent with SyncProviderDependencies {
  const ProjectListPage({super.key});

  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [projectsProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        yield ul(
          classes: 'divide-y',
          projects.sortedByYearAndOrder().map(ProjectListItem.new).toList(),
        );
    }
  }
}
