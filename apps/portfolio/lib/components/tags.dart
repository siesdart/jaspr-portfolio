import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class Tags extends StatelessComponent {
  const Tags(this.tags, {this.classes, super.key});

  final List<String> tags;
  final String? classes;

  @override
  Component build(BuildContext context) {
    if (tags.isEmpty) return const Component.fragment([]);

    return ul(
      classes: cn(['flex flex-wrap gap-2 list-none', classes]),
      tags
          .map(
            (tag) => li([
              Badge(
                classes: 'text-primary bg-primary/10',
                children: [Component.text('#$tag')],
              ),
            ]),
          )
          .toList(),
    );
  }
}
