import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/content.dart';
import 'package:ui/ui.dart';

class Skill extends StatelessComponent {
  const Skill({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(skillProvider)) {
      case AsyncData(value: final skill):
        return MarkdownArticle(
          content: skill,
          components: [
            CustomComponent(
              pattern: 'Icon-dev',
              builder: (name, attributes, child) => Icon.dev(
                icon: attributes['icon'] ?? '',
                alt: attributes['alt'],
              ),
            ),
            CustomComponent(
              pattern: 'Icon',
              builder: (name, attributes, child) => Icon(
                src: attributes['src'] ?? '',
                alt: attributes['alt'],
              ),
            ),
          ],
        );
      default:
        return div(classes: 'text-center text-gray-500', [text('Loading...')]);
    }
  }
}
