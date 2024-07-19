import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:portfolio/models/config.dart';
import 'package:portfolio/models/project.dart';

final _dio = Dio(BaseOptions(responseType: ResponseType.bytes));

Future<Uint8List> buildResumePdfData({
  required Config config,
  required String introduction,
  required String skill,
  required List<Project> projects,
}) async {
  final pdf = Document(
    title: '${config.name}의 이력서',
    theme: await buildThemeData(),
  )..addPage(MultiPage(
      build: (context) {
        return [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      _UrlLink(text: config.mail, url: 'mailto:${config.mail}'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _UrlLink(url: config.url),
                      _UrlLink(
                        url: 'https://github.com/${config.github.first.user}',
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.only(top: 24)),
              _Paragraph(content: introduction),
              Padding(padding: const EdgeInsets.only(top: 16)),
              _Category(title: '1. 기술 스택'),
              _Paragraph(content: skill),
              _Category(title: '2. 프로젝트'),
              Padding(padding: const EdgeInsets.only(top: 6)),
              for (final MapEntry(:key, :value) in projects.groupByYear())
                ...value.sortedByOrder().mapIndexed(
                      (i, project) => _History(
                        title: project.title,
                        period: i == 0 ? key.toString() : '',
                        children: [
                          Text(project.introduction),
                          Text(
                            project.tags.map((e) => '#$e').join(' '),
                            style: const TextStyle(color: PdfColors.grey),
                          ),
                        ],
                      ),
                    ),
              Padding(padding: const EdgeInsets.only(top: 16)),
              _Category(title: '3. 학력'),
              Padding(padding: const EdgeInsets.only(top: 6)),
              ...config.education.map(
                (education) => _History(
                  title: education.title,
                  period: education.period,
                  children: [Text(education.content)],
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 16)),
              _Category(title: '4. 수상 내역'),
              Padding(padding: const EdgeInsets.only(top: 6)),
              ...config.award.map(
                (award) => _History(
                  title: award.title,
                  period: award.period,
                  children: [Text(award.content)],
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 16)),
              _Category(title: '5. 기타'),
              Padding(padding: const EdgeInsets.only(top: 6)),
              ...config.etc.map(
                (etc) => _History(
                  title: etc.title,
                  period: etc.period,
                  children: [Text(etc.content)],
                ),
              ),
            ],
          ),
        ];
      },
    ));

  return pdf.save();
}

Future<ThemeData> buildThemeData() async {
  final base = await _loadFontFile('/fonts/IBMPlexSansKR-Regular.ttf');
  final bold = await _loadFontFile('/fonts/IBMPlexSansKR-Bold.ttf');
  return ThemeData.withFont(base: base, bold: bold);
}

Future<Font> _loadFontFile(String url) async {
  final response = await _dio.get<List<int>>(url);
  return Font.ttf(ByteData.sublistView(Uint8List.fromList(response.data!)));
}

class _Category extends StatelessWidget {
  final String title;

  _Category({required this.title});

  @override
  Widget build(Context context) {
    return Text(
      title,
      textScaleFactor: 1.2,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class _History extends StatelessWidget {
  final String title;
  final String period;
  final List<Widget> children;

  _History({required this.title, required this.period, required this.children});

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

class _Paragraph extends StatelessWidget {
  final String content;

  _Paragraph({required this.content});

  @override
  Widget build(Context context) {
    return Paragraph(
      text: content,
      style: Theme.of(context).defaultTextStyle.copyWith(lineSpacing: 1.2),
    );
  }
}

class _UrlLink extends StatelessWidget {
  final String? text;
  final String url;

  _UrlLink({required this.url, this.text});

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
