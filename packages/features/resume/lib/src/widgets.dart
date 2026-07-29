import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class RBullet extends StatelessWidget {
  @override
  Widget build(Context context) {
    return Container(
      width: 1.5 * PdfPageFormat.mm,
      height: 1.5 * PdfPageFormat.mm,
      margin: const EdgeInsets.only(
        left: 1.5 * PdfPageFormat.mm,
        top: 2.5 * PdfPageFormat.mm,
        right: 2.5 * PdfPageFormat.mm,
      ),
      decoration: const BoxDecoration(
        color: PdfColors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class RCategory extends StatelessWidget {
  RCategory(this.text);

  final String text;

  @override
  Widget build(Context context) {
    return Text(
      text,
      textScaleFactor: 1.2,
      style: TextStyle(fontWeight: .bold),
    );
  }
}

class RHistory extends StatelessWidget {
  RHistory({required this.title, required this.period, required this.children});

  final String title;
  final String period;
  final List<Widget> children;

  @override
  Widget build(Context context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(width: 2)),
      ),
      padding: const EdgeInsets.only(left: 8, bottom: 6),
      margin: const EdgeInsets.only(left: 2),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: 64,
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              period,
              style: const TextStyle(color: PdfColors.grey600),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: .bold),
                ),
                ...children,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RParagraph extends StatelessWidget {
  RParagraph(this.text);

  final String text;

  @override
  Widget build(Context context) {
    return Paragraph(
      text: text,
      margin: EdgeInsets.zero,
      style: Theme.of(context).defaultTextStyle.copyWith(lineSpacing: 1.2),
    );
  }
}

class RUrlLink extends StatelessWidget {
  RUrlLink({required this.url, this.text});

  final String? text;
  final String url;

  @override
  Widget build(Context context) {
    return UrlLink(
      destination: url,
      child: Text(
        text ?? url,
        textScaleFactor: 0.9,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: PdfColors.grey,
        ),
      ),
    );
  }
}

class RTitle extends StatelessWidget {
  RTitle({required this.config});

  final Config config;

  @override
  Widget build(Context context) {
    return Row(
      crossAxisAlignment: .end,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: config.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                    ),
                  ),
                  const TextSpan(text: '  '),
                  TextSpan(text: config.site.first.title),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 2)),
            Text(
              config.description,
              style: const TextStyle(color: PdfColors.grey800),
            ),
            Padding(padding: const EdgeInsets.only(top: 2)),
            RUrlLink(
              text: config.mail,
              url: 'mailto:${config.mail}',
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: .end,
          children: [
            RUrlLink(url: config.url),
            RUrlLink(url: config.site.first.url),
          ],
        ),
      ],
    );
  }
}

class RMarkdown extends StatelessWidget {
  RMarkdown(this.text);

  final String text;

  @override
  Widget build(Context context) {
    final nodes = md.Document(
      extensionSet: md.ExtensionSet.gitHubWeb,
    ).parse(text);

    return Column(
      crossAxisAlignment: .start,
      children: _buildMarkdown(nodes),
    );
  }

  List<Widget> _buildMarkdown(Iterable<md.Node> nodes) {
    return nodes.map((node) {
      if (node is md.Element) {
        switch (node.tag) {
          case 'p':
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RParagraph(node.textContent),
            );
          case 'a':
            return RUrlLink(
              url: node.attributes['href'] ?? '',
              text: node.textContent,
            );
          case 'ol':
            return Column(
              crossAxisAlignment: .start,
              children: _buildMarkdown(node.children ?? [])
                  .mapIndexed(
                    (i, e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: .start,
                        children: <Widget>[
                          Text('${i + 1}. '),
                          Expanded(child: e),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          case 'ul':
            return Column(
              crossAxisAlignment: .start,
              children: _buildMarkdown(node.children ?? [])
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: .start,
                        children: <Widget>[
                          RBullet(),
                          Expanded(child: e),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          default:
            return Wrap(
              children: _buildMarkdown(node.children ?? []),
            );
        }
      } else if (node is md.Text) {
        return Text(node.text);
      } else {
        return SizedBox.shrink();
      }
    }).toList();
  }
}
