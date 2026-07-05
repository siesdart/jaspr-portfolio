import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Image extends StatelessComponent {
  const Image({
    required this.src,
    this.classes,
    this.alt,
    this.loading = MediaLoading.lazy,
    this.attributes,
    super.key,
  });

  final String? classes;
  final String src;
  final String? alt;
  final MediaLoading? loading;
  final Map<String, String>? attributes;

  @override
  Component build(BuildContext context) {
    return img(
      classes: classes,
      src: src.replaceAll(
        RegExp(r'\.(jpg|jpeg|png)', caseSensitive: false),
        '.webp',
      ),
      alt: alt,
      loading: loading,
      attributes: {
        'onError': "this.src='$src'",
        ...?attributes,
      },
    );
  }
}
