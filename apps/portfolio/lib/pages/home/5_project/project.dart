import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/5_project/components/project_item.dart';
import 'package:portfolio/providers/content.dart';

class Project extends StatelessComponent {
  const Project({super.key});

  @override
  Component build(BuildContext context) {
    final content = context.watch(contentProvider);
    return .fragment(content.projects.map(ProjectItem.new).toList());
  }
}
