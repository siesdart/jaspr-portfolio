import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/opensource/opensource_item.dart';
import 'package:portfolio/providers/content.dart';

class Opensource extends StatelessComponent {
  const Opensource({super.key});

  @override
  Component build(BuildContext context) {
    switch (context.watch(opensourceProvider)) {
      case AsyncData(value: final opensource):
        return fragment(
          opensource.map(OpensourceItem.new).toList(),
        );
      default:
        return const Component.empty();
    }
  }
}
