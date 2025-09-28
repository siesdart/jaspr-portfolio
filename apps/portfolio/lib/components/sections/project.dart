import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/project/project_item.dart';
import 'package:portfolio/providers/content.dart';

class Project extends StatelessComponent {
  const Project({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        return fragment(
          projects.groupByYear().map((entry) {
            return li(classes: 'flex flex-col gap-2', [
              span(classes: 'text-gray-400', [text(entry.key.toString())]),
              ul(
                classes: 'list-disc ml-8 space-y-2',
                entry.value.sortedByOrder().map(ProjectItem.new).toList(),
              ),
            ]);
          }).toList(),
        );
      default:
        return div(classes: 'text-center text-gray-500', [text('Loading...')]);
    }
  }
}
