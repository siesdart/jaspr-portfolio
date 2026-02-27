import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/pages/home/5_opensource/components/contribution_item.dart';
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
          const [
            Icon(
              'github',
              classes: 'size-6 fill-slate-900',
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
          opensource.contribution!
              .map(
                (contribution) => ContributionItem(
                  contribution,
                  opensource: opensource,
                ),
              )
              .toList(),
        ),
    ]);
  }
}
