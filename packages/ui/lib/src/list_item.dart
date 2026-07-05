import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ui/src/cn.dart';

class ListItem extends StatelessComponent {
  const ListItem({this.classes, this.children, this.to, super.key});

  final String? classes;
  final List<Component>? children;
  final String? to;

  @override
  Component build(BuildContext context) {
    return li(
      classes: cn([
        'p-4 rounded-lg transition-all hover:bg-muted hover:scale-[1.02]',
        classes,
      ]),
      children != null
          ? (to != null ? [Link(to: to!, children: children)] : children!)
          : [],
    );
  }
}
