import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/markdown_article.dart';
import 'package:portfolio/providers/content.dart';

class Introduction extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final markdown = context.watch(introductionProvider);
    yield MarkdownArticle(markdown: markdown.valueOrNull ?? '');
  }
}
