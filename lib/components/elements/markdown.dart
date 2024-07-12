import 'package:jaspr/jaspr.dart';
import 'package:markdown/markdown.dart' as md show Element, Text;
import 'package:markdown/markdown.dart' hide Element, Text;

class Markdown extends StatefulComponent {
  const Markdown({required this.markdown, this.blockSyntaxes, super.key});

  final String markdown;

  final Iterable<BlockSyntax>? blockSyntaxes;

  @override
  State<Markdown> createState() => _MarkdownState();
}

class _MarkdownState extends State<Markdown> {
  late Document document;
  late List<Node> nodes;

  @override
  void initState() {
    super.initState();
    parseMarkdown();
  }

  @override
  void didUpdateComponent(covariant Markdown oldComponent) {
    super.didUpdateComponent(oldComponent);
    if (oldComponent.markdown != component.markdown) {
      parseMarkdown();
    }
  }

  void parseMarkdown() {
    document = Document(
      blockSyntaxes: component.blockSyntaxes,
      extensionSet: ExtensionSet.gitHubWeb,
    );
    nodes = document
        .parseLines(component.markdown.replaceAll('\r\n', '\n').split('\n'));
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(
      classes:
          'prose prose-li:marker:text-inherit prose-li:prose-li:list-dash leading-5 max-w-full lg:leading-6',
      buildMarkdown(nodes).toList(),
    );
  }

  Iterable<Component> buildMarkdown(Iterable<Node> nodes) sync* {
    for (final node in nodes) {
      if (node is md.Text) {
        yield span([raw(node.text)]);
      } else if (node is md.Element) {
        yield DomComponent(
          tag: node.tag,
          id: node.generatedId,
          attributes: node.attributes,
          children: node.children != null
              ? buildMarkdown(node.children!).toList()
              : null,
        );
      }
    }
  }
}
