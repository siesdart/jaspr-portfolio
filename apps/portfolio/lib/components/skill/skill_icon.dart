import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SkillIcon extends StatelessComponent {
  const SkillIcon({required this.src, this.alt, super.key});

  const SkillIcon.dev({required String icon, String? alt, Key? key})
    : this(
        src: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/$icon',
        alt: alt,
        key: key,
      );

  final String src;
  final String? alt;

  @override
  Component build(BuildContext context) {
    return div(
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
