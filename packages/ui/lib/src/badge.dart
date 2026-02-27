import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/src/cn.dart';

enum BadgeVariant {
  primary,
  secondary,
}

String badgeVariants({
  BadgeVariant variant = BadgeVariant.primary,
}) {
  return cn([
    'inline-flex items-center justify-center rounded-full border border-transparent px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 [&>svg]:size-3 gap-1 [&>svg]:pointer-events-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive transition-[color,box-shadow] overflow-hidden',
    {
      BadgeVariant.primary:
          'bg-primary text-primary-foreground [a&]:hover:bg-primary/90',
      BadgeVariant.secondary:
          'bg-secondary text-secondary-foreground [a&]:hover:bg-secondary/90',
    }[variant],
  ]);
}

class Badge extends StatelessComponent {
  const Badge({
    this.classes,
    this.variant = BadgeVariant.primary,
    this.children,
    super.key,
  });

  final String? classes;
  final BadgeVariant variant;
  final List<Component>? children;

  @override
  Component build(BuildContext context) {
    return span(
      classes: cn([badgeVariants(variant: variant), classes]),
      children ?? [],
    );
  }
}
