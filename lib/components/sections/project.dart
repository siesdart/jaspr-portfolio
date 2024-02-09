import 'package:collection/collection.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/project_card.dart';
import 'package:portfolio/providers/project.dart';

class Project extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(projectsProvider)) {
      case AsyncData(:final value):
        final projects = groupBy(value, (project) => project.createdAt.year)
            .entries
            .sorted((a, b) => b.key.compareTo(a.key));
        for (final MapEntry(:key, :value) in projects) {
          yield div(classes: 'flex gap-4', [
            span(classes: 'text-gray-400', [text(key.toString())]),
            div(
              classes: 'flex-1 grid grid-cols-1 gap-4 md:grid-cols-2',
              value
                  .map((project) => ProjectCard(
                        url: project.url,
                        fullName: project.fullName,
                        description: project.description ?? '',
                        stargazersCount: project.stargazersCount,
                        forks: project.forks,
                        pushedAt: project.pushedAt,
                      ))
                  .toList(),
            ),
          ]);
        }
    }
  }
}
