import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/project_card.dart';
import 'package:portfolio/providers/project.dart';

class Project extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'grid grid-cols-1 gap-4 md:grid-cols-2',
      switch (context.watch(projectsProvider)) {
        AsyncData(:final value) => value
            .map((project) => ProjectCard(
                  url: project.url,
                  fullName: project.fullName,
                  description: project.description ?? '',
                  stargazersCount: project.stargazersCount,
                  forks: project.forks,
                  pushedAt: project.pushedAt,
                ))
            .toList(),
        _ => [],
      },
    );
  }
}
