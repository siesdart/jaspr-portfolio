import 'package:jaspr/jaspr.dart';

class Section extends StatelessComponent {
  final String? id;
  final String title;
  final bool border;
  final List<Component> children;

  const Section({
    required this.title,
    required this.children,
    this.id,
    this.border = false,
  });

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
      div(
        classes: '${border ? 'border-l-2 mx-5 px-3' : 'px-6'} space-y-4',
        children,
      ),
    ]);
  }
}
