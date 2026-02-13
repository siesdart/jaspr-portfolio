import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/src/clsx.dart';

enum ButtonVariant {
  primary,
  ghost,
  link,
}

enum ButtonSize {
  small,
  medium,
  large,
}

String buttonVariants({
  ButtonVariant variant = ButtonVariant.primary,
  ButtonSize size = ButtonSize.medium,
}) {
  return clsx([
    "inline-flex items-center justify-center gap-2 cursor-pointer whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg:not([class*='size-'])]:size-4 shrink-0 [&_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive",
    {
      ButtonVariant.primary: 'bg-blue-500 text-white hover:bg-blue-600',
      ButtonVariant.ghost:
          'hover:bg-gray-100 hover:text-gray-900 dark:hover:bg-gray-100/50',
      ButtonVariant.link: 'underline-offset-4 hover:underline',
    }[variant],
    {
      ButtonSize.small: 'h-8 rounded-md gap-1.5 px-3 has-[>svg]:px-2.5',
      ButtonSize.medium: 'h-9 px-4 py-2 has-[>svg]:px-3',
      ButtonSize.large: 'h-10 rounded-md px-6 has-[>svg]:px-4',
    }[size],
  ]);
}

class Button extends StatelessComponent {
  const Button({
    this.classes,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.onClick,
    this.disabled = false,
    this.children,
    super.key,
  });

  final String? classes;
  final ButtonVariant variant;
  final ButtonSize size;
  final VoidCallback? onClick;
  final bool disabled;
  final List<Component>? children;

  @override
  Component build(BuildContext context) {
    return button(
      classes: clsx([buttonVariants(variant: variant, size: size), classes]),
      children ?? [],
      disabled: disabled,
      onClick: onClick,
    );
  }
}
