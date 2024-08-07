import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:resume/src/theme.dart';
import 'package:resume/src/widgets.dart';

class ResumePdf {
  ResumePdf({
    required this.config,
    required this.introduction,
    required this.skill,
    required this.projects,
  });

  final Config config;
  final String introduction;
  final String skill;
  final List<Project> projects;

  Future<Uint8List> buildData() async {
    final pdf = Document(
      title: '${config.name}의 이력서',
      theme: await buildThemeData(),
    )..addPage(MultiPage(build: (context) => [_buildPage()]));

    return pdf.save();
  }

  Widget _buildPage() {
    return Column(
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
        ),
        Padding(padding: const EdgeInsets.only(top: 24)),
        RParagraph(content: introduction),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '1. 기술 스택'),
        RParagraph(content: skill),
        RCategory(title: '2. 프로젝트'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        for (final MapEntry(:key, :value) in projects.groupByYear())
          ...value.sortedByOrder().mapIndexed(
                (i, project) => RHistory(
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
        RCategory(title: '3. 학력'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...config.education.map(
          (education) => RHistory(
            title: education.title,
            period: education.period,
            children: [Text(education.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '4. 수상 내역'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...config.award.map(
          (award) => RHistory(
            title: award.title,
            period: award.period,
            children: [Text(award.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '5. 기타'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...config.etc.map(
          (etc) => RHistory(
            title: etc.title,
            period: etc.period,
            children: [Text(etc.content)],
          ),
        ),
      ],
    );
  }
}
