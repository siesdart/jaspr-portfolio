import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/src/clsx.dart';

class ListItem extends StatelessComponent {
  const ListItem({this.classes, this.children, super.key});

  final String? classes;
  final List<Component>? children;

  @override
  Component build(BuildContext context) {
    return li(
      classes: clsx([
        'p-4 rounded-lg hover:bg-gray-100 transition-all hover:scale-[1.02] dark:hover:bg-gray-100/50',
        classes,
      ]),
      children ?? [],
    );
  }
}
