import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/experience/experience_item.dart';
import 'package:portfolio/providers/content.dart';

class Experience extends StatelessComponent with SyncProviderDependencies {
  const Experience({super.key});

  @override
  Iterable<SyncProvider<dynamic>> get preloadDependencies => [
    experiencesProvider,
  ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(experiencesProvider)) {
      case AsyncData(value: final experiences):
        yield* experiences.sortedByPeriod().map(ExperienceItem.new);
    }
  }
}
