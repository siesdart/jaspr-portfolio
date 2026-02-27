import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/src/cn.dart';

class ListItem extends StatelessComponent {
  const ListItem({this.classes, this.children, super.key});

  final String? classes;
  final List<Component>? children;

  @override
  Component build(BuildContext context) {
    return li(
      classes: cn([
        'p-4 rounded-lg transition-all hover:bg-muted hover:scale-[1.02]',
        classes,
      ]),
      children ?? [],
    );
  }
}
