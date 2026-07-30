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
    required this.content,
    super.key,
  });

  final Config config;
  final Content content;

  @override
  Component build(BuildContext context) {
    return .fragment([
      Button(
        size: ButtonSize.large,
        onClick: () {
          final iframe = document.createElement('iframe') as HTMLIFrameElement;
          iframe.style.position = 'fixed';
          iframe.style.right = '0';
          iframe.style.bottom = '0';
          iframe.style.width = '0';
          iframe.style.height = '0';
          iframe.style.border = '0';

          iframe.src = window.location.origin;
          iframe.onLoad.listen((_) {
            if (iframe.contentWindow != null) {
              iframe.contentWindow!.focus();
              iframe.contentWindow!.print();

              window.setTimeout(
                () {
                  document.body?.removeChild(iframe);
                }.toJS,
                null,
                1000,
              );
            }
          });

          document.body?.appendChild(iframe);
        },
        children: const [.text('이력서')],
      ),
      Button(
        size: ButtonSize.large,
        onClick: () => _downloadPdf(
          PortfolioPdf(
            config: config,
            projects: content.projects,
          ),
        ),
        children: const [.text('포트폴리오')],
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
