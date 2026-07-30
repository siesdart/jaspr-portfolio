import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/3_career/components/career_item.dart';
import 'package:portfolio/providers/content.dart';

class Career extends StatelessComponent {
  const Career({super.key});

  @override
  Component build(BuildContext context) {
    final content = context.watch(contentProvider);
    return .fragment(
      content.careers.map(CareerItem.new).toList(),
    );
  }
}
