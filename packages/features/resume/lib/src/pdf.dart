import 'dart:async';
import 'dart:typed_data';

import 'package:pdf/widgets.dart';
import 'package:resume/src/utils.dart';

abstract class Pdf {
  const Pdf({this.title, this.author});

  final String? title;
  final String? author;

  Future<Uint8List> buildData() async {
    final doc = Document(
      title: title,
      author: author,
      theme: await themeData(),
    );
    final images = await loadImages();
    doc.addPage(MultiPage(build: (context) => buildPages(images).toList()));
    return doc.save();
  }

  Future<ThemeData> themeData() async {
    final base = await networkFont('/fonts/IBMPlexSansKR-Regular.ttf');
    final bold = await networkFont('/fonts/IBMPlexSansKR-Bold.ttf');
    return ThemeData.withFont(base: base, bold: bold);
  }

  Future<Map<String, ImageProvider>> loadImages() async => {};

  Iterable<Widget> buildPages(Map<String, ImageProvider> images);
}
