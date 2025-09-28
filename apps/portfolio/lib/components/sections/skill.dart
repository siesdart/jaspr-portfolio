import 'package:jaspr/jaspr.dart';
import 'package:jaspr_markdown/jaspr_markdown.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/providers/content.dart';
import 'package:ui/ui.dart';

class Skill extends StatelessComponent {
  const Skill({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(skillProvider)) {
      case AsyncData(value: final skill):
        return MarkdownArticle(
          markdown: skill,
          blockSyntaxes: [
            ComponentBlockSyntax(importComponents: const [Icon]),
          ],
        );
      default:
        return div(classes: 'text-center text-gray-500', [text('Loading...')]);
    }
  }
}
