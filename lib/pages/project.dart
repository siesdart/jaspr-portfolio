import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/project.dart' as model;

@client
class Project extends StatelessComponent {
  final model.Project project;

  const Project(this.project, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield span([text(project.title)]);
  }
}
