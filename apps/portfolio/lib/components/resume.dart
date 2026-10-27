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
    iframe.onLoad.listen((_) {
      final printWindow = iframe.contentWindow;
      if (printWindow == null) return;

      final closePrint = () {
        document.body?.removeChild(iframe);
      }.toJS;
      printWindow
        ..onbeforeunload = closePrint
        ..onafterprint = closePrint
        ..focus()
        ..print();
    });
    iframe.style.display = 'none';
    iframe.src = '${window.location.origin}$path';
    document.body?.appendChild(iframe);
  }
}
