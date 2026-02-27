import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return const footer(
      classes: 'flex justify-center border-t border-border mx-2 py-6 lg:py-8',
      [
        JasprBadge.darkTwoTone(),
      ],
    );
  }
}
