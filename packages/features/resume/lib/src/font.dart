import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart';

Future<Font> loadFontFile(String url) async {
  final response = await http.get(Uri.parse(url));
  return Font.ttf(ByteData.sublistView(response.bodyBytes));
}
