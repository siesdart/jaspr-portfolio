import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart';

@client
class Resume extends StatelessComponent {
  const Resume({required this.config, required this.content, super.key});

  final Config config;
  final Content content;

  @override
  Component build(BuildContext context) {
    return .fragment([
      Button(
        size: ButtonSize.large,
        onClick: () => _printPage(''),
        children: const [.text('이력서')],
      ),
      Button(
        size: ButtonSize.large,
        onClick: () => _printPage('/portfolio-print'),
        children: const [.text('포트폴리오')],
      ),
    ]);
  }

  void _printPage(String path) {
    final iframe = document.createElement('iframe') as HTMLIFrameElement;
    iframe.style.position = 'fixed';
    iframe.style.right = '0';
    iframe.style.bottom = '0';
    iframe.style.width = '0';
    iframe.style.height = '0';
    iframe.style.border = '0';
    iframe.src = '${window.location.origin}$path';
    iframe.onLoad.listen((_) {
      final printWindow = iframe.contentWindow;
      if (printWindow == null) return;

      printWindow
        ..focus()
        ..print();
      window.setTimeout(
        () {
          document.body?.removeChild(iframe);
        }.toJS,
        null,
        1000,
      );
    });

    document.body?.appendChild(iframe);
  }
}
