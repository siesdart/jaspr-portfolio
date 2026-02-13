import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/markdown.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

class MarkdownArticle extends StatelessComponent {
  const MarkdownArticle({
    required this.content,
    this.components = const [],
    super.key,
  });

  final String content;
  final List<CustomComponent> components;

  @override
  Component build(BuildContext context) {
    return article(
      classes: 'prose max-w-full',
      [
        Content.wrapTheme(
          const ContentTheme.none(),
          child: Markdown(
            content: content,
            components: components,
          ),
        ),
      ],
    );
  }
}
