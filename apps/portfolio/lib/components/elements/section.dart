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
  Iterable<Component> build(BuildContext context) sync* {
    yield section(id: id, [
      a(
        [
          h4(
            classes:
                'bg-[#13B9FD] font-medium text-lg text-white mb-4 px-4 py-2 rounded-2xl shadow-md lg:text-xl',
            [text(title)],
          ),
        ],
        href: '#$id',
      ),
      if (child != null) div(classes: 'px-6', [child!]),
      if (children != null)
        ul(
          classes: 'border-l-2 mx-5 px-3 space-y-4',
          children!,
        ),
    ]);
  }
}
