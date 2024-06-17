import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/project.dart';

class ProjectItem extends StatelessComponent {
  final Project project;

  const ProjectItem(this.project);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li([
      article(classes: 'flex flex-col items-start', [
        a(
          classes: 'font-medium hover:bg-[#B8EAFE]',
          [
            h5([text(project.title)]),
          ],
          href: 'projects/${project.id}',
        ),
        p(classes: 'font-light', [text(project.introduction)]),
        span(
          classes: 'font-extralight',
          [text(project.tags.map((tag) => '#$tag').join(' '))],
        ),
      ]),
    ]);
  }
}
