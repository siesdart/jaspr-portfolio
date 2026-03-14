import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class ContributionItem extends StatelessComponent {
  const ContributionItem(
    this.contribution, {
    required this.opensource,
    super.key,
  });

  final Contribution contribution;
  final Opensource opensource;

  @override
  Component build(BuildContext context) {
    return li([
      span([
        .text(contribution.title!),
        a(
          classes: cn([buttonVariants(variant: ButtonVariant.link)]),
          href: 'https://github.com/${opensource.repo}/pull/${contribution.id}',
          target: .blank,
          [
            const .text('#'),
            .text(contribution.id.toString()),
          ],
        ),
      ]),
      const br(),
      span(
        classes: 'font-light',
        [.text(contribution.description)],
      ),
    ]);
  }
}
