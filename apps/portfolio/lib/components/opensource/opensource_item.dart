import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class OpensourceItem extends StatelessComponent {
  const OpensourceItem(this.opensource, {super.key});

  final Opensource opensource;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col items-start gap-1', [
      div(classes: 'flex items-center gap-2', [
        h5(
          classes: 'font-medium',
          [Component.text(opensource.repo.split('/')[1])],
        ),
        a(
          href: 'https://github.com/${opensource.repo}',
          target: Target.blank,
          [
            svg(
              classes: 'size-6 fill-slate-900',
              viewBox: '0 0 24 24',
              SvgIcons.github,
            ),
          ],
        ),
        img(
          src:
              'https://img.shields.io/github/stars/${opensource.repo}?style=flat',
          alt: 'github stars',
          loading: MediaLoading.lazy,
        ),
      ]),
      span(classes: 'font-light', [Component.text(opensource.description)]),
      span(
        classes: 'font-extralight',
        [const Component.text('Role: '), Component.text(opensource.role)],
      ),
      if (opensource.contribution != null)
        ul(
          classes: 'list-disc ml-5 mt-1 space-y-2',
          opensource.contribution!.map(_buildContributionItem).toList(),
        ),
    ]);
  }

  Component _buildContributionItem(Contribution contribution) {
    return li([
      span([
        Component.text(contribution.title!),
        a(
          classes: 'ml-1 transition-colors text-blue-400 hover:text-blue-500',
          href: 'https://github.com/${opensource.repo}/pull/${contribution.id}',
          target: Target.blank,
          [
            const Component.text('#'),
            Component.text(contribution.id.toString()),
          ],
        ),
      ]),
      const br(),
      span(
        classes: 'font-light',
        [Component.text(contribution.description)],
      ),
    ]);
  }
}
