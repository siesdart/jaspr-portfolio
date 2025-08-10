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
    final url = URL.createObjectURL(
      Blob(
        [pdfData.buffer.toJS].toJS,
        BlobPropertyBag(type: 'application/pdf'),
      ),
    );
    window.open(url, '_blank');
  }
}
