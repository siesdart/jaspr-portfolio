import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio/providers/config.dart';
import 'package:ui/ui.dart';

enum TitleSize {
  small,
  large,
}

class Title extends StatelessComponent {
  const Title({
    required this.size,
    this.classes,
    super.key,
  });

  final TitleSize size;
  final String? classes;

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final index = config.title.indexOf('.');

    return div(
      classes: classes,
      [
        Link(
          to: '/',
          replace: true,
          child: h2(
            classes: clsx([
              'font-semibold text-blue-500',
              if (size == TitleSize.large) 'text-7xl' else 'text-4xl',
            ]),
            [
              Component.text('(${config.title.substring(0, index)}'),
              span(
                classes: 'text-sky-500',
                [Component.text('${config.title.substring(index)})')],
              ),
            ],
          ),
        ),
        h3(
          classes: clsx([
            'font-light text-gray-400',
            if (size == TitleSize.large)
              'mt-2 text-end text-xl'
            else
              'mt-1 text-center',
          ]),
          [Component.text(config.description)],
        ),
      ],
    );
  }
}
