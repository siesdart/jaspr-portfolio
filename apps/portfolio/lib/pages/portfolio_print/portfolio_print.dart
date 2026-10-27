import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/pages/projects/detail/components/article.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class PortfolioPrintPage extends StatelessComponent {
  const PortfolioPrintPage({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final content = context.watch(contentProvider);
    final title = '${config.name}의 포트폴리오';

    return .fragment([
      Document.head(title: title, meta: const {'robots': 'noindex, nofollow'}),
      for (final project in content.projects.sortedByYearAndOrder())
        section(classes: 'break-before-page first:break-before-auto', [
          ProjectArticle(project: project),
        ]),
    ]);
  }
}
