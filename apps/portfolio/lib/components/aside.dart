import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/resume.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';
import 'package:ui/ui.dart';

class Aside extends StatelessComponent {
  const Aside({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final content = context.watch(contentProvider);

    return aside(
      classes: 'flex flex-col gap-2 w-56 lg:fixed lg:top-60',
      [
        h4(
          classes:
              'self-center font-semibold tracking-wide lg:text-lg lg:tracking-wider',
          [.text(config.name)],
        ),
        ...config.site.map(
          (site) => _buildItem(
            Icon(
              site.icon ?? 'link',
              classes: 'size-6 fill-foreground',
            ),
            site.title,
            site.url,
          ),
        ),
        const hr(classes: 'border-border my-1 lg:my-2'),
        _buildItem(
          const Icon(
            'cake',
            classes: 'size-6 stroke-foreground',
          ),
          config.birth,
        ),
        _buildItem(
          const Icon(
            'mail',
            classes: 'size-6 stroke-foreground',
          ),
          config.mail,
          'mailto:${config.mail}',
        ),
        div(
          classes: 'self-center flex flex-col gap-1 mt-1 lg:mt-2 print:hidden',
          [
            Resume(config: config, content: content),
          ],
        ),
      ],
    );
  }

  Component _buildItem(Component svg, String title, [String? href]) {
    return div(classes: 'flex items-center gap-2', [
      svg,
      if (href != null)
        a(
          classes: 'underline-offset-4 hover:underline',
          href: href,
          target: .blank,
          attributes: const {'rel': 'noopener noreferrer'},
          [.text(title)],
        )
      else
        span([.text(title)]),
    ]);
  }
}
