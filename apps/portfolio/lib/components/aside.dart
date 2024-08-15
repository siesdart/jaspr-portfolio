import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/resume.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';

class Aside extends StatelessComponent with SyncProviderDependencies {
  const Aside({super.key});

  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [
        introductionProvider,
        skillProvider,
        projectsProvider,
      ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;
    final introduction = context.watch(introductionProvider);
    final skill = context.watch(skillProvider);
    final projects = context.watch(projectsProvider);

    yield aside(
      classes: 'flex flex-col gap-2 w-56 lg:fixed lg:top-60',
      [
        h4(
          classes:
              'self-center font-semibold text-base tracking-wide lg:text-l lg:tracking-wider',
          [text(config.name)],
        ),
        ...config.github.map(
          (github) => _buildItem(
            svg(
              classes: 'size-5 lg:size-6 fill-slate-900',
              viewBox: '0 0 24 24',
              SvgIcons.github,
            ),
            github.title,
            'https://github.com/${github.user}',
          ),
        ),
        hr(classes: 'my-1 lg:my-2'),
        _buildItem(
          svg(
            classes: 'size-5 lg:size-6 fill-none stroke-slate-900',
            viewBox: '0 0 24 24',
            SvgIcons.cake,
          ),
          config.birth,
        ),
        _buildItem(
          svg(
            classes: 'size-5 lg:size-6 fill-none stroke-slate-900',
            viewBox: '0 0 24 24',
            SvgIcons.mapPin,
          ),
          config.location,
        ),
        _buildItem(
          svg(
            classes: 'size-5 lg:size-6 fill-none stroke-slate-900',
            viewBox: '0 0 24 24',
            SvgIcons.envelope,
          ),
          config.mail,
          'mailto:${config.mail}',
        ),
        div(classes: 'self-center mt-1 lg:mt-2', [
          Resume(
            config: config,
            introduction: introduction.value ?? '',
            skill: skill.value ?? '',
            projects: projects.value ?? [],
            disabled: [introduction, skill, projects].any((e) => !e.hasValue),
          ),
        ]),
      ],
    );
  }

  Component _buildItem(Component svg, String title, [String? href]) {
    return div(classes: 'flex items-center gap-1 lg:gap-2', [
      svg,
      if (href != null)
        a(
          [text(title)],
          href: href,
          target: Target.blank,
        )
      else
        span([text(title)]),
    ]);
  }
}
