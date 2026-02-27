import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/4_project/components/project_item.dart';
import 'package:portfolio/providers/content.dart';

class Project extends StatelessComponent {
  const Project({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(projectsProvider)) {
      case AsyncData(value: final projects):
        return Component.fragment(
          projects
              .groupByYear()
              .map(
                (entry) => li(classes: 'flex flex-col gap-2', [
                  span(classes: 'text-gray-400', [
                    Component.text(entry.key.toString()),
                  ]),
                  ul(
                    entry.value.sortedByOrder().map(ProjectItem.new).toList(),
                  ),
                ]),
              )
              .toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
