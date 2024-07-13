import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/config.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/utils/pdf.dart';

@Import.onWeb('dart:html', show: [#Blob, #Url, #window])
// ignore: always_use_package_imports
import 'resume_button.imports.dart';

@client
class ResumeButton extends StatelessComponent {
  final Config config;
  final String introduction;
  final String skill;
  final List<Project> projects;
  final bool disabled;

  const ResumeButton({
    required this.config,
    required this.introduction,
    required this.skill,
    required this.projects,
    this.disabled = false,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      classes:
          'self-center bg-[#1967D2] font-semibold w-28 px-4 py-2 rounded-xl text-center text-white lg:w-32',
      [text('이력서')],
      attributes: {if (disabled) 'disabled': ''},
      onClick: downloadResume,
    );
  }

  Future<void> downloadResume() async {
    final pdfData = await buildResumePdfData(
      config: config,
      introduction: introduction,
      skill: skill,
      projects: projects,
    );
    final url = Url.createObjectUrl(Blob([pdfData], 'application/pdf'));
    window.open(url, '_blank');
  }
}
