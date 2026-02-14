import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/markdown.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';
import 'package:ui/ui.dart';

class MarkdownArticle extends StatelessComponent {
  const MarkdownArticle({
    required this.content,
    this.components = const [],
    this.classes,
    super.key,
  });

  final String content;
  final List<CustomComponent> components;
  final String? classes;

  @override
  Component build(BuildContext context) {
    return article(
      classes: cn(['prose max-w-full', classes]),
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
