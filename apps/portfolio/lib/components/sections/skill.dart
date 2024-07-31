import 'package:jaspr/jaspr.dart';
import 'package:jaspr_markdown/jaspr_markdown.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/icon.dart';
import 'package:portfolio/components/elements/markdown_article.dart';
import 'package:portfolio/providers/content.dart';

class Skill extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final markdown = context.watch(skillProvider);
    yield MarkdownArticle(
      markdown: markdown.valueOrNull ?? '',
      blockSyntaxes: [
        ComponentBlockSyntax(importComponents: const [Icon]),
      ],
    );
  }
}
