import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/3_experience/components/experience_item.dart';
import 'package:portfolio/providers/content.dart';

class Experience extends StatelessComponent {
  const Experience({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(experiencesProvider)) {
      case AsyncData(value: final experiences):
        return Component.fragment(
          experiences.sortedByPeriod().map(ExperienceItem.new).toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
