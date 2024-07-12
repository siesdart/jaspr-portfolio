import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/markdown.dart';
import 'package:portfolio/providers/content.dart';

class Introduction extends StatelessComponent with SyncProviderDependencies {
  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [introductionProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final markdown = context.watch(introductionProvider);
    yield Markdown(markdown: markdown.valueOrNull ?? '');
  }
}
