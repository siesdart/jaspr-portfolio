import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:resume/resume.dart';
import 'package:ui/ui.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart';

@client
class Resume extends StatelessComponent {
  const Resume({
    required this.config,
    required this.introduction,
    required this.skill,
    required this.experiences,
    required this.projects,
    required this.opensources,
    super.key,
  });

  final Config config;
  final String? introduction;
  final String? skill;
  final List<Experience>? experiences;
  final List<Project>? projects;
  final List<Opensource>? opensources;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Button(
        size: ButtonSize.large,
        onClick: () => _downloadPdf(
          ResumePdf(
            config: config,
            introduction: introduction!,
            skill: skill!,
            experiences: experiences!,
            projects: projects!,
            opensources: opensources!,
          ),
        ),
        disabled: [
          introduction,
          skill,
          experiences,
          projects,
          opensources,
        ].any((e) => e == null),
        children: const [Component.text('이력서')],
      ),
      Button(
        size: ButtonSize.large,
        onClick: () => _downloadPdf(
          PortfolioPdf(
            config: config,
            projects: projects!,
          ),
        ),
        disabled: projects == null,
        children: const [Component.text('포트폴리오')],
      ),
    ]);
  }

  Future<void> _downloadPdf(Pdf pdf) async {
    final pdfData = await pdf.buildData();
    final url = URL.createObjectURL(
      Blob(
        [pdfData.buffer.toJS].toJS,
        BlobPropertyBag(type: 'application/pdf'),
      ),
    );
    window.open(url, '_blank');
  }
}
