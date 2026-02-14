import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/skill/skill_icon.dart';
import 'package:portfolio/providers/content.dart';

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
              pattern: 'SkillIcon-dev',
              builder: (name, attributes, child) => SkillIcon.dev(
                icon: attributes['icon'] ?? '',
                alt: attributes['alt'],
                delay: attributes['delay'],
              ),
            ),
            CustomComponent(
              pattern: 'SkillIcon',
              builder: (name, attributes, child) => SkillIcon(
                src: attributes['src'] ?? '',
                alt: attributes['alt'],
                delay: attributes['delay'],
              ),
            ),
          ],
        );
      default:
        return const Component.empty();
    }
  }
}
