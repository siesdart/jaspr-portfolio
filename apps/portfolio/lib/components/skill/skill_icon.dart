import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SkillIcon extends StatelessComponent {
  const SkillIcon({required this.src, this.alt, this.delay, super.key});

  const SkillIcon.dev({
    required String icon,
    String? alt,
    String? delay,
    Key? key,
  }) : this(
         src: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/$icon',
         alt: alt,
         delay: delay,
         key: key,
       );

  final String src;
  final String? alt;
  final String? delay;

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          'inline-block bg-gray-100 p-2 rounded-full hover:bg-gray-200 lg:p-4 md:animate-[float_6s_ease-in-out_infinite]',
      styles: delay != null ? Styles(raw: {'animation-delay': delay!}) : null,
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

  @css
  static List<StyleRule> get styles => [
    css.keyframes(
      'float',
      {
        '0%': const Styles(
          transform: Transform.translate(x: Unit.pixels(0), y: Unit.pixels(0)),
        ),
        '25%': const Styles(
          transform: Transform.translate(x: Unit.pixels(2), y: Unit.pixels(-5)),
        ),
        '50%': const Styles(
          transform: Transform.translate(
            x: Unit.pixels(0),
            y: Unit.pixels(-10),
          ),
        ),
        '75%': const Styles(
          transform: Transform.translate(
            x: Unit.pixels(-2),
            y: Unit.pixels(-5),
          ),
        ),
        '100%': const Styles(
          transform: Transform.translate(x: Unit.pixels(0), y: Unit.pixels(0)),
        ),
      },
    ),
  ];
}
