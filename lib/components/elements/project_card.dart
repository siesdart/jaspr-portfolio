import 'package:jaspr/jaspr.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectCard extends StatelessComponent {
  final String url;
  final String fullName;
  final String description;
  final int stargazersCount;
  final int forks;
  final DateTime pushedAt;

  const ProjectCard({
    required this.url,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.forks,
    required this.pushedAt,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      href: url,
      target: Target.blank,
      classes:
          'flex flex-col justify-center bg-white w-full h-32 max-w-72 mx-auto px-4 rounded-lg ring-1 ring-gray-100 shadow hover:bg-gray-100 lg:max-w-80 lg:h-36',
      [
        h5(
          classes:
              'font-medium text-base whitespace-nowrap text-clip overflow-hidden lg:text-lg',
          [text(fullName)],
        ),
        p(
          classes:
              'flex-1 font-light text-sm text-gray-400 text-ellipsis break-words overflow-hidden max-h-10 lg:text-base lg:max-h-12',
          [text(description)],
        ),
        div(classes: 'flex items-center text-xs mt-2 lg:text-sm', [
          svg(
            classes: 'w-5 h-5 fill-slate-900 mr-1',
            viewBox: '0 0 24 24',
            [
              path(
                [],
                d: 'M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z',
              ),
            ],
          ),
          span([text(stargazersCount.toString())]),
          svg(
            classes: 'w-4 h-4 fill-slate-900 ml-3 mr-1',
            viewBox: '0 0 16 16',
            [
              path(
                [],
                d: 'M5 5.372v.878c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-.878a2.25 2.25 0 1 1 1.5 0v.878a2.25 2.25 0 0 1-2.25 2.25h-1.5v2.128a2.251 2.251 0 1 1-1.5 0V8.5h-1.5A2.25 2.25 0 0 1 3.5 6.25v-.878a2.25 2.25 0 1 1 1.5 0ZM5 3.25a.75.75 0 1 0-1.5 0 .75.75 0 0 0 1.5 0Zm6.75.75a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Zm-3 8.75a.75.75 0 1 0-1.5 0 .75.75 0 0 0 1.5 0Z',
              ),
            ],
          ),
          span([text(forks.toString())]),
          span(classes: 'flex-1 text-end', [text(timeago.format(pushedAt))]),
        ]),
      ],
    );
  }
}
