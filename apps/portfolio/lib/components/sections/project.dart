import 'package:common/common.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/project_item.dart';
import 'package:portfolio/providers/content.dart';

class Project extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(:final value):
        final projects = value.groupByYear();
        for (final MapEntry(:key, :value) in projects) {
          yield div(classes: 'flex flex-col gap-2', [
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
