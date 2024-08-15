import 'package:common/common.dart';
import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';

class OpensourceItem extends StatelessComponent {
  const OpensourceItem(this.opensource, {super.key});

  final Opensource opensource;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex flex-col items-start', [
      div(classes: 'flex items-center gap-1', [
        h5(
          classes: 'font-medium',
          [text(opensource.repo.split('/')[1])],
        ),
        a(
          [
            svg(
              classes: 'size-5 lg:size-6 fill-slate-900',
              viewBox: '0 0 24 24',
              SvgIcons.github,
            ),
          ],
          href: 'https://github.com/${opensource.repo}',
          target: Target.blank,
        ),
        img(
          src:
              'https://img.shields.io/github/stars/${opensource.repo}?style=flat',
          alt: 'github stars',
          loading: MediaLoading.lazy,
        ),
      ]),
      span(classes: 'font-light', [text(opensource.description)]),
      span(
        classes: 'font-extralight',
        [text('Role: '), text(opensource.role)],
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
        text(contribution.title!),
        a(
          classes: 'text-[#13B9FD]',
          [text('#'), text(contribution.id.toString())],
          href: 'https://github.com/${opensource.repo}/pull/${contribution.id}',
          target: Target.blank,
        ),
      ]),
      br(),
      span(
        classes: 'font-light',
        [text(contribution.description)],
      ),
    ]);
  }
}
