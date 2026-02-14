import 'package:core/core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:resume/src/pdf.dart';
import 'package:resume/src/utils.dart';
import 'package:resume/src/widgets.dart';

class PortfolioPdf extends Pdf {
  PortfolioPdf({
    required this.config,
    required this.projects,
  }) : super(
         title: '${config.name}의 포트폴리오',
         author: config.name,
       );

  final Config config;
  final List<Project> projects;

  @override
  Iterable<Widget> buildPages(Map<String, ImageProvider> images) sync* {
    yield Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RTitle(config: config),
        ...projects
            .sortedByYearAndOrder()
            .reversed
            .map(
              (project) => [
                Padding(padding: const EdgeInsets.only(top: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RCategory(title: project.title),
                    Text(project.year.toString(), textScaleFactor: 0.8),
                  ],
                ),
                Text(project.introduction),
                if (project.repo != null)
                  RUrlLink(url: 'https://github.com/${project.repo}'),
                if (project.files != null)
                  ...project.files!.map(
                    (file) => RUrlLink(url: '${config.url}/${file.src}'),
                  ),
                Padding(padding: const EdgeInsets.only(top: 6)),
                /*
                if (images.containsKey(project.id))
                  Container(
                    width: 100,
                    height: 100,
                    child: Image(images[project.id]!),
                  ),
                */
                RParagraph(content: project.content),
                Text(
                  project.tags.map((e) => '#$e').join(' '),
                  style: const TextStyle(color: PdfColors.grey),
                ),
              ],
            )
            .expand((e) => e),
      ],
    );
  }

  @override
  Future<Map<String, ImageProvider>> loadImages() async {
    return {
      for (final project in projects)
        if (project.image != null)
          project.id: await networkImage(project.image!),
    };
  }
}
