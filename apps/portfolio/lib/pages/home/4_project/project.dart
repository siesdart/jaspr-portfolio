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
    final content = context.watch(contentProvider);
    return .fragment(
      content.projects
          .groupByYear()
          .map(
            (entry) => li(classes: 'flex flex-col gap-1', [
              span(
                classes: 'text-muted-foreground',
                [.text(entry.key.toString())],
              ),
              ul(
                entry.value.sortedByOrder().map(ProjectItem.new).toList(),
              ),
            ]),
          )
          .toList(),
    );
  }
}
