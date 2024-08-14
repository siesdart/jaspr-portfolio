import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/markdown_article.dart';
import 'package:portfolio/providers/content.dart';

class Introduction extends StatelessComponent with SyncProviderDependencies {
  const Introduction({super.key});

  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [introductionProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    switch (context.watch(introductionProvider)) {
      case AsyncData(value: final introduction):
        yield MarkdownArticle(markdown: introduction);
    }
  }
}
