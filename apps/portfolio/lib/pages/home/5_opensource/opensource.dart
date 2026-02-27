import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/5_opensource/components/opensource_item.dart';
import 'package:portfolio/providers/content.dart';

class Opensource extends StatelessComponent {
  const Opensource({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(opensourcesProvider)) {
      case AsyncData(value: final opensources):
        return Component.fragment(
          opensources.sortedByOrder().map(OpensourceItem.new).toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
