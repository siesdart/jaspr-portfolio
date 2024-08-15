import 'package:common/common.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/elements/button.dart';
import 'package:resume/resume.dart' deferred as resume;

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
      onClick: downloadResume,
      disabled: disabled,
    );
  }

  Future<void> downloadResume() async {
    await resume.loadLibrary();
    final pdfData = await resume.ResumePdf(
      config: config,
      introduction: introduction,
      skill: skill,
      projects: projects,
    ).buildData();
    final url = Url.createObjectUrl(Blob([pdfData], 'application/pdf'));
    window.open(url, '_blank');
  }
}
