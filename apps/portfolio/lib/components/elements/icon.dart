import 'package:jaspr/jaspr.dart';

class Icon extends StatelessComponent {
  const Icon({required this.src, this.alt});

  const Icon.dev({required String icon, String? alt})
      : this(
          src: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$icon',
          alt: alt,
        );

  final String src;
  final String? alt;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes:
          'inline-block bg-gray-100 p-2 rounded-full hover:bg-gray-200 lg:p-4',
      [
        img(
          classes: 'size-8 lg:size-12',
          src: src,
          alt: alt,
          loading: MediaLoading.lazy,
        ),
      ],
    );
  }
}
