import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class NavButton extends StatelessComponent {
  const NavButton({required this.name, required this.path, super.key});

  final String name;
  final String path;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final currentPath = context.binding.currentUri.path;
    yield Link(
      classes: (path.replaceAll('/', '').isNotEmpty &&
                  currentPath.contains(path)) ||
              currentPath == path
          ? 'decoration-2 decoration-[#1967D2] font-semibold underline underline-offset-4'
          : null,
      to: path,
      child: text(name),
    );
  }
}
