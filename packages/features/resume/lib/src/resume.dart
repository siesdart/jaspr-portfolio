import 'package:collection/collection.dart';
import 'package:core/core.dart';
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
    required this.careers,
    required this.projects,
    required this.opensources,
  }) : super(
         title: '${config.name}의 이력서',
         author: config.name,
       );

  final Config config;
  final String introduction;
  final String skill;
  final List<Career> careers;
  final List<Project> projects;
  final List<Opensource> opensources;

  @override
  Stream<SpanningWidget> buildPages(Map<String, ImageProvider> images) async* {
    yield Column(
      crossAxisAlignment: .start,
      children: [
        RTitle(config: config),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RParagraph(removeHtml(introduction)),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('1. 기술 스택'),
        RParagraph(removeHtml(skill)),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('2. 경력'),
        Padding(padding: const EdgeInsets.only(top: 8)),
        ...careers.map(
          (career) => RHistory(
            title: career.company,
            period: career.period,
            children: [
              Text(career.role),
              Padding(padding: const EdgeInsets.only(top: 8)),
              RParagraph(
                career.content
                    .split('\n')
                    .firstWhere((e) => e.trim().isNotEmpty),
              ),
              Text(
                career.tags.map((e) => '#$e').join(' '),
                style: const TextStyle(color: PdfColors.grey),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('3. 프로젝트'),
        Padding(padding: const EdgeInsets.only(top: 8)),
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
        RCategory('4. 오픈소스'),
        ...opensources.sortedByOrder().map(
          (opensource) => Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  opensource.repo.split('/')[1],
                  style: const TextStyle(fontWeight: .bold),
                ),
                Text(opensource.description),
                Text('Role: ${opensource.role}'),
                RUrlLink(url: 'https://github.com/${opensource.repo}'),
                if (opensource.contribution != null) ...[
                  Padding(padding: const EdgeInsets.only(top: 4)),
                  ...opensource.contribution!.map((contribution) {
                    final title = contribution.title ?? 'Title unavailable';
                    return Row(
                      crossAxisAlignment: .start,
                      children: <Widget>[
                        RBullet(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text('$title #${contribution.id}'),
                              Text(contribution.description),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('5. 학력'),
        Padding(padding: const EdgeInsets.only(top: 8)),
        ...config.education.map(
          (education) => RHistory(
            title: education.title,
            period: education.period,
            children: [Text(education.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('6. 수상 및 자격증'),
        Padding(padding: const EdgeInsets.only(top: 8)),
        ...config.award.map(
          (award) => RHistory(
            title: award.title,
            period: award.period,
            children: [Text(award.content)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 16)),
        RCategory('7. 기타'),
        Padding(padding: const EdgeInsets.only(top: 8)),
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
