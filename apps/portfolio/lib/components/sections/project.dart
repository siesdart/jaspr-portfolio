import 'package:common/common.dart';
import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/content.dart';

class Project extends StatelessComponent with SyncProviderDependencies {
  const Project({super.key});

  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [projectsProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        for (final MapEntry(:key, :value) in projects.groupByYear()) {
          yield li(classes: 'flex flex-col gap-2', [
            span(classes: 'text-gray-400', [text(key.toString())]),
            ul(
              classes: 'list-disc ml-8 space-y-2',
              value.sortedByOrder().map(ProjectItem.new).toList(),
            ),
          ]);
        }
    }
  }
}
