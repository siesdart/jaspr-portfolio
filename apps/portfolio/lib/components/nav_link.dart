import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class NavLink extends StatelessComponent {
  const NavLink({required this.name, required this.path, super.key});

  final String name;
  final String path;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Link(
      classes:
          (path.replaceAll('/', '').isNotEmpty && context.url.contains(path)) ||
              context.url == path
          ? 'decoration-2 decoration-[#1967D2] font-semibold underline underline-offset-4'
          : null,
      to: path,
      child: text(name),
    );
  }
}
