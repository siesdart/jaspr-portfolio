import 'dart:async';
import 'dart:typed_data';

import 'package:pdf/widgets.dart';
import 'package:resume/src/utils.dart';

abstract class Pdf {
  const Pdf({this.title, this.author});

  final String? title;
  final String? author;

  Future<Uint8List> buildData() async {
    final doc = Document(title: title, author: author);
    final theme = await buildTheme();
    final images = await loadImages();
    final pages = await buildPages(images).toList();

    doc.addPage(
      MultiPage(
        theme: theme,
        build: (context) => [
          Partitions(
            children: pages.map((page) => Partition(child: page)).toList(),
          ),
        ],
      ),
    );
    return doc.save();
  }

  Future<ThemeData> buildTheme() async {
    final base = await networkFont('/fonts/IBMPlexSansKR-Regular.ttf');
    final bold = await networkFont('/fonts/IBMPlexSansKR-Bold.ttf');
    final fallback = await networkFont(
      '/fonts/NotoSansKR-VariableFont_wght.ttf',
    );

    return ThemeData.withFont(
      base: base,
      bold: bold,
      fontFallback: [fallback],
    );
  }

  Future<Map<String, ImageProvider>> loadImages() async => {};

  Stream<SpanningWidget> buildPages(Map<String, ImageProvider> images);
}
