import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:ui/src/button.dart';
import 'package:ui/src/cn.dart';

class NavLink extends StatelessComponent {
  const NavLink({
    required this.name,
    required this.path,
    this.classes,
    super.key,
  });

  final String? classes;
  final String name;
  final String path;

  @override
  Component build(BuildContext context) {
    final isActive =
        (path.replaceAll('/', '').isNotEmpty && context.url.contains(path)) ||
        context.url == path;
    return Link(
      classes: cn([
        buttonVariants(variant: ButtonVariant.link, size: ButtonSize.large),
        'text-foreground',
        {
          'decoration-2 decoration-blue-500 font-semibold underline underline-offset-[5px]':
              isActive,
        },
        classes,
      ]),
      to: path,
      child: Component.text(name),
    );
  }
}
