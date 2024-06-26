import 'package:jaspr/jaspr.dart';

class NavButton extends StatelessComponent {
  final String name;
  final String path;

  const NavButton({required this.name, required this.path});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      classes: context.binding.currentUri.path ==
              (path.startsWith('/') ? path : '/$path')
          ? 'decoration-2 decoration-[#1967D2] font-semibold underline underline-offset-4'
          : null,
      [text(name)],
      href: path,
    );
  }
}
