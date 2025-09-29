import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/providers/content.dart';

class Introduction extends StatelessComponent {
  const Introduction({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(introductionProvider)) {
      case AsyncData(value: final introduction):
        return MarkdownArticle(content: introduction);
      default:
        return div(classes: 'text-center text-gray-500', [text('Loading...')]);
    }
  }
}
