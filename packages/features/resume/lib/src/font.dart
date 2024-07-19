import 'dart:typed_data';

import 'package:pdf/widgets.dart';
import 'package:resume/src/http.dart';

Future<Font> loadFontFile(String url) async {
  final response = await dio.get<List<int>>(url);
  return Font.ttf(ByteData.sublistView(Uint8List.fromList(response.data!)));
}
