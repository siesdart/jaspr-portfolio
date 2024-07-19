import 'package:pdf/widgets.dart';
import 'package:resume/src/font.dart';

Future<ThemeData> buildThemeData() async {
  final base = await loadFontFile('/fonts/IBMPlexSansKR-Regular.ttf');
  final bold = await loadFontFile('/fonts/IBMPlexSansKR-Bold.ttf');
  return ThemeData.withFont(base: base, bold: bold);
}
