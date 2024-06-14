import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/project.dart';

class ProjectItem extends StatelessComponent {
  final Project project;

  const ProjectItem(this.project);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li([
      article(classes: 'flex flex-col items-start', [
        a(href: 'projects/${project.id}', [
          h5(classes: 'font-medium', [text(project.title)]),
        ]),
        p(classes: 'font-light', [text(project.introduction)]),
        span(
          classes: 'font-extralight',
          [text(project.tags.map((tag) => '#$tag').join(' '))],
        ),
      ]),
    ]);
  }
}
