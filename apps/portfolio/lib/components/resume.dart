import 'package:common/common.dart';
import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:resume/resume.dart';

@Import.onWeb('dart:html', show: [#Blob, #Url, #window])
// ignore: always_use_package_imports
import 'resume.imports.dart';

@client
class Resume extends StatelessComponent {
  const Resume({
    required this.config,
    required this.introduction,
    required this.skill,
    required this.projects,
    required this.disabled,
    super.key,
  });

  final Config config;
  final String introduction;
  final String skill;
  final List<Project> projects;
  final bool disabled;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Button(
      label: '이력서',
      onClick: () => _downloadPdf(
        ResumePdf(
          config: config,
          introduction: introduction,
          skill: skill,
          projects: projects,
        ),
      ),
      disabled: disabled,
    );
    yield Button(
      label: '포트폴리오',
      onClick: () => _downloadPdf(
        PortfolioPdf(
          config: config,
          projects: projects,
        ),
      ),
      disabled: disabled,
    );
  }

  Future<void> _downloadPdf(Pdf pdf) async {
    final pdfData = await pdf.buildData();
    final url = Url.createObjectUrl(Blob([pdfData], 'application/pdf'));
    window.open(url, '_blank');
  }
}
