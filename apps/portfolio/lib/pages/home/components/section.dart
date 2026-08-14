import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Section extends StatelessComponent {
  const Section.content({
    required this.title,
    required this.child,
    this.id,
    super.key,
  }) : children = null;

  const Section.list({
    required this.title,
    required this.children,
    this.id,
    super.key,
  }) : child = null;

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
            [.text(title)],
          ),
        ]),
        if (child case final content?) div([content]),
        if (children case final items?) ul(classes: 'space-y-8', items),
      ],
    );
  }
}
