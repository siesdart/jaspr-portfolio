import 'package:core/core.dart' as core;
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class ProjectAttachments extends StatelessComponent {
  const ProjectAttachments({required this.files, super.key});

  final List<core.File> files;

  @override
  Component build(BuildContext context) {
    if (files.isEmpty) return const Component.fragment([]);

    return ul(
      classes: 'not-prose flex flex-wrap gap-3 list-none',
      files
          .map(
            (file) => li([
              a(
                classes: cn([
                  buttonVariants(
                    variant: ButtonVariant.secondary,
                    size: ButtonSize.small,
                  ),
                ]),
                href: file.src,
                target: Target.blank,
                [
                  const Icon(
                    'paperclip',
                    classes: 'stroke-secondary-foreground',
                  ),
                  span([Component.text(file.name)]),
                ],
              ),
            ]),
          )
          .toList(),
    );
  }
}
