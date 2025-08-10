import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart';

Future<Font> networkFont(String url) async {
  final response = await http.get(Uri.parse(url));
  return Font.ttf(response.bodyBytes.buffer.asByteData());
}

Future<ImageProvider> networkImage(String url) async {
  final response = await http.get(Uri.parse(url));
  return MemoryImage(response.bodyBytes);
}

String removeHtml(String str) => parseFragment(
  str,
).nodes.whereType<dom.Text>().map((e) => e.text).join('\n\n').trim();
