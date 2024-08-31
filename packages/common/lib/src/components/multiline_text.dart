import 'package:jaspr/jaspr.dart';

class MultilineText extends StatelessComponent {
  const MultilineText(this.text, {super.key});

  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    for (final line in text.trim().split('\n')) {
      yield span([Text(line), br()]);
    }
  }
}
