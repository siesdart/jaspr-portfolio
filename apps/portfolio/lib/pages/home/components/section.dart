import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Section extends StatelessComponent {
  const Section({
    required this.title,
    this.child,
    this.children,
    this.id,
    super.key,
  });

  final String? id;
  final String title;
  final Component? child;
  final List<Component>? children;

  @override
  Component build(BuildContext context) {
    return section(
      id: id,
      classes: 'scroll-mt-14 lg:scroll-mt-44',
      [
        a(href: '#$id', [
          h2(
            classes:
                'text-xl font-bold border-b-2 border-primary pb-2 mb-6 lg:text-2xl',
            [Component.text(title)],
          ),
        ]),
        if (child != null) div(classes: 'px-2', [child!]),
        if (children != null)
          ul(
            classes: 'space-y-6',
            children!,
          ),
      ],
    );
  }
}
