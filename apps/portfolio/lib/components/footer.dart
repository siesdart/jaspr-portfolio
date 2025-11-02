import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(
      classes: 'flex justify-center border-t border-gray-200 mx-2 py-6 lg:py-8',
      [
        const JasprBadge.darkTwoTone(),
      ],
    );
  }
}
