import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ui/ui.dart';

class ProjectListItem extends StatelessComponent {
  const ProjectListItem(this.project, {super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    return Link(
      to: 'projects/${project.id}',
      children: [
        ListItem(
          children: [
            div(classes: 'flex items-center gap-2', [
              svg(
                classes: 'size-2',
                styles: Styles(raw: {'fill': '#${project.color}'}),
                viewBox: '0 0 16 16',
                [circle(cx: '8', cy: '8', r: '8', [])],
              ),
              h5(classes: 'font-medium', [text(project.title)]),
              div(classes: 'flex-1', []),
              span(classes: 'font-light text-sm', [
                text(project.year.toString()),
              ]),
            ]),
            p(classes: 'font-light', [text(project.introduction)]),
            span(
              classes: 'font-extralight text-gray-600',
              project.tags.map((tag) => text('#$tag ')).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
