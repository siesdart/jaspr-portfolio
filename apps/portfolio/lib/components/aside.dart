import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/resume.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/providers/content.dart';
import 'package:ui/ui.dart';

class Aside extends StatelessComponent {
  const Aside({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);
    final introduction = context.watch(introductionProvider);
    final skill = context.watch(skillProvider);
    final experiences = context.watch(experiencesProvider);
    final projects = context.watch(projectsProvider);
    final opensources = context.watch(opensourcesProvider);

    return aside(
      classes: 'flex flex-col gap-2 w-56 lg:fixed lg:top-60',
      [
        h4(
          classes:
              'self-center font-semibold tracking-wide lg:text-lg lg:tracking-wider',
          [text(config.name)],
        ),
        ...config.github.map(
          (github) => _buildItem(
            svg(
              classes: 'size-6 fill-slate-700',
              viewBox: '0 0 24 24',
              SvgIcons.github,
            ),
            github.title,
            'https://github.com/${github.user}',
          ),
        ),
        hr(classes: 'border-gray-200 my-1 lg:my-2'),
        _buildItem(
          svg(
            classes: 'size-6 fill-none stroke-slate-700',
            viewBox: '0 0 24 24',
            SvgIcons.cake,
          ),
          config.birth,
        ),
        _buildItem(
          svg(
            classes: 'size-6 fill-none stroke-slate-700',
            viewBox: '0 0 24 24',
            SvgIcons.mapPin,
          ),
          config.location,
        ),
        _buildItem(
          svg(
            classes: 'size-6 fill-none stroke-slate-700',
            viewBox: '0 0 24 24',
            SvgIcons.mail,
          ),
          config.mail,
          'mailto:${config.mail}',
        ),
        div(classes: 'self-center flex flex-col gap-1 mt-1 lg:mt-2', [
          Resume(
            config: config,
            introduction: introduction.value,
            skill: skill.value,
            experiences: experiences.value,
            projects: projects.value,
            opensources: opensources.value,
          ),
        ]),
      ],
    );
  }

  Component _buildItem(Component svg, String title, [String? href]) {
    return div(classes: 'flex items-center gap-2', [
      svg,
      if (href != null)
        a(
          classes: 'underline-offset-4 hover:underline',
          href: href,
          target: Target.blank,
          [text(title)],
        )
      else
        span([text(title)]),
    ]);
  }
}
