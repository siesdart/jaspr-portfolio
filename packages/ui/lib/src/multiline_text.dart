import 'package:jaspr/jaspr.dart';

class MultilineText extends StatelessComponent {
  const MultilineText(this.text, {super.key});

  final String text;

  @override
  Component build(BuildContext context) {
    return fragment(
      text
          .trim()
          .split('\n')
          .map((line) => span([Component.text(line), br()]))
          .toList(),
    );
  }
}
