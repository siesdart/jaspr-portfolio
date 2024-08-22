import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:resume/src/pdf.dart';
import 'package:resume/src/utils.dart';
import 'package:resume/src/widgets.dart';

class ResumePdf extends Pdf {
  ResumePdf({
    required this.config,
    required this.introduction,
    required this.skill,
    required this.projects,
  }) : super(
          title: '${config.name}의 이력서',
          author: config.name,
        );

  final Config config;
  final String introduction;
  final String skill;
  final List<Project> projects;

  @override
  Iterable<Widget> buildPages(Map<String, ImageProvider> images) sync* {
    yield Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RTitle(config: config),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RParagraph(content: removeHtml(introduction)),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '1. 기술 스택'),
        RParagraph(content: removeHtml(skill)),
        Padding(padding: const EdgeInsets.only(top: 16)),
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
        RCategory(title: '3. 오픈소스'),
        ...config.opensource.map(
          (opensource) => Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  opensource.repo.split('/')[1],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(opensource.description),
                Text(
                  'Role: ${opensource.role}',
                  style: const TextStyle(color: PdfColors.grey),
                ),
                if (opensource.contribution != null)
                  ...opensource.contribution!.map(
                    (contribution) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RBullet(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${contribution.title} #${contribution.id}'),
                              Text(contribution.description),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '4. 학력'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...config.education.map(
          (education) => RHistory(
            title: education.title,
            period: education.period,
            children: [Text(education.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '5. 수상 내역'),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...config.award.map(
          (award) => RHistory(
            title: award.title,
            period: award.period,
            children: [Text(award.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory(title: '6. 기타'),
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
