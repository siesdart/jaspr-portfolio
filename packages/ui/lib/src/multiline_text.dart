import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class MultilineText extends StatelessComponent {
  const MultilineText(this.text, {super.key});

  final String text;

  @override
  Component build(BuildContext context) {
    return Component.fragment(
      text
          .trim()
          .split('\n')
          .map((text) => span([Component.text(text), const br()]))
          .toList(),
    );
  }
}
