import 'package:common/common.dart';
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
  RCategory({required this.title});

  final String title;

  @override
  Widget build(Context context) {
    return Text(
      title,
      textScaleFactor: 1.2,
      style: TextStyle(fontWeight: FontWeight.bold),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
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
  RParagraph({required this.content});

  final String content;

  @override
  Widget build(Context context) {
    return Paragraph(
      text: content,
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: config.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: '  '),
                  TextSpan(text: config.github.first.title),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RUrlLink(url: config.url),
            RUrlLink(
              url: 'https://github.com/${config.github.first.user}',
            ),
          ],
        ),
      ],
    );
  }
}
