import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/providers/content.dart';

class Introduction extends StatelessComponent {
  const Introduction({super.key});

  @override
  Component build(BuildContext context) {
    final content = context.watch(contentProvider);
    return MarkdownArticle(content: content.introduction);
  }
}
