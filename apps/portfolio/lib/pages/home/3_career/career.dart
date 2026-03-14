import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/3_career/components/career_item.dart';
import 'package:portfolio/providers/content.dart';

class Career extends StatelessComponent {
  const Career({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(careersProvider)) {
      case AsyncData(value: final careers):
        return .fragment(
          careers.sortedByPeriod().map(CareerItem.new).toList(),
        );
      default:
        return const .empty();
    }
  }
}
