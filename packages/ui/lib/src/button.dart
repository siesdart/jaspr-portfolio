import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/src/cn.dart';

enum ButtonVariant {
  primary,
  secondary,
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
  return cn([
    "focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 rounded-lg border border-transparent bg-clip-padding cursor-pointer text-sm font-medium focus-visible:ring-3 aria-invalid:ring-3 [&_svg:not([class*='size-'])]:size-4 inline-flex items-center justify-center whitespace-nowrap transition-all disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none shrink-0 [&_svg]:shrink-0 outline-none group/button select-none",
    {
      ButtonVariant.primary:
          'bg-primary text-primary-foreground [a]:hover:bg-primary/80',
      ButtonVariant.secondary:
          'bg-secondary text-secondary-foreground hover:bg-secondary/80 aria-expanded:bg-secondary aria-expanded:text-secondary-foreground',
      ButtonVariant.ghost:
          'hover:bg-muted hover:text-foreground dark:hover:bg-muted/50 aria-expanded:bg-muted aria-expanded:text-foreground',
      ButtonVariant.link: 'text-primary underline-offset-4 hover:underline',
    }[variant],
    {
      ButtonSize.small:
          "h-7 gap-1 rounded-[min(var(--radius-md),12px)] px-2.5 text-[0.8rem] in-data-[slot=button-group]:rounded-lg has-data-[icon=inline-end]:pr-1.5 has-data-[icon=inline-start]:pl-1.5 [&_svg:not([class*='size-'])]:size-3.5",
      ButtonSize.medium:
          'h-8 gap-1.5 px-2.5 has-data-[icon=inline-end]:pr-2 has-data-[icon=inline-start]:pl-2',
      ButtonSize.large:
          'h-9 gap-1.5 px-2.5 has-data-[icon=inline-end]:pr-3 has-data-[icon=inline-start]:pl-3',
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
      classes: cn([buttonVariants(variant: variant, size: size), classes]),
      children ?? [],
      disabled: disabled,
      onClick: onClick,
    );
  }
}
