import 'package:collection/collection.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/project_list_item.dart';
import 'package:portfolio/providers/content.dart';

@client
class ProjectListPage extends StatelessComponent {
  const ProjectListPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(:final value):
        yield ul(
          classes: 'divide-y',
          value
              .sorted((a, b) {
                final c = b.year.compareTo(a.year);
                return c == 0 ? b.order.compareTo(a.order) : c;
              })
              .map(ProjectListItem.new)
              .toList(),
        );
    }
  }
}
