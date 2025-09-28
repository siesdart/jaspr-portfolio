import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(
      classes: 'border-t border-gray-200 text-center mx-2 py-6 lg:py-8',
      [
        a(
          classes:
              'text-xs decoration-2 decoration-[#00BCD4] underline underline-offset-8 mx-auto lg:text-sm',
          href: 'https://github.com/schultek/jaspr',
          target: Target.blank,
          [
            text('본 홈페이지는 '),
            span(classes: 'font-bold', [text('Jaspr')]),
            text('를 사용해 제작되었습니다.'),
          ],
        ),
      ],
    );
  }
}
