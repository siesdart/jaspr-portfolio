import 'package:jaspr/jaspr.dart';
import 'package:jaspr_markdown/jaspr_markdown.dart';

class MarkdownArticle extends StatelessComponent {
  const MarkdownArticle({
    required this.markdown,
    this.blockSyntaxes,
    super.key,
  });

  final String markdown;
  final Iterable<BlockSyntax>? blockSyntaxes;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(
      classes:
          'prose prose-li:marker:text-inherit prose-li:prose-li:list-dash leading-5 max-w-full lg:leading-6',
      [
        Markdown(
          markdown: markdown,
          blockSyntaxes: blockSyntaxes,
        ),
      ],
    );
  }
}
