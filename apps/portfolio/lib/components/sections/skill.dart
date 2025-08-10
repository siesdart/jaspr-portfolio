import 'package:jaspr/jaspr.dart';
import 'package:jaspr_markdown/jaspr_markdown.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/content.dart';
import 'package:ui/ui.dart';

class Skill extends StatelessComponent with SyncProviderDependencies {
  const Skill({super.key});

  @override
  Iterable<SyncProvider<dynamic>> get preloadDependencies => [skillProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(skillProvider)) {
      case AsyncData(value: final skill):
        yield MarkdownArticle(
          markdown: skill,
          blockSyntaxes: [
            ComponentBlockSyntax(importComponents: const [Icon]),
          ],
        );
    }
  }
}
