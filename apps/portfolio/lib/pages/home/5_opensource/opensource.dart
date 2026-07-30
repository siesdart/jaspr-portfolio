import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/home/5_opensource/components/opensource_item.dart';
import 'package:portfolio/providers/content.dart';

class Opensource extends StatelessComponent {
  const Opensource({super.key});

  @override
  Component build(BuildContext context) {
    final content = context.watch(contentProvider);
    return .fragment(
      content.opensources.map(OpensourceItem.new).toList(),
    );
  }
}
