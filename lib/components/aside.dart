import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/config.dart';

class Aside extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;
    yield aside(
      classes: 'flex flex-col gap-2 w-56 lg:fixed lg:top-64',
      [
        ...config.github.map(
          (github) => _buildItem(
            svg(
              classes: 'size-5 lg:size-6 fill-slate-900',
              viewBox: '0 0 24 24',
              [
                path(
                  [],
                  d: 'M12 2C6.477 2 2 6.463 2 11.97c0 4.404 2.865 8.14 6.839 9.458.5.092.682-.216.682-.48 0-.236-.008-.864-.013-1.695-2.782.602-3.369-1.337-3.369-1.337-.454-1.151-1.11-1.458-1.11-1.458-.908-.618.069-.606.069-.606 1.003.07 1.531 1.027 1.531 1.027.892 1.524 2.341 1.084 2.91.828.092-.643.35-1.083.636-1.332-2.22-.251-4.555-1.107-4.555-4.927 0-1.088.39-1.979 1.029-2.675-.103-.252-.446-1.266.098-2.638 0 0 .84-.268 2.75 1.022A9.607 9.607 0 0 1 12 6.82c.85.004 1.705.114 2.504.336 1.909-1.29 2.747-1.022 2.747-1.022.546 1.372.202 2.386.1 2.638.64.696 1.028 1.587 1.028 2.675 0 3.83-2.339 4.673-4.566 4.92.359.307.678.915.678 1.846 0 1.332-.012 2.407-.012 2.734 0 .267.18.577.688.48 3.97-1.32 6.833-5.054 6.833-9.458C22 6.463 17.522 2 12 2Z',
                ),
              ],
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
            [
              path(
                [],
                d: 'M12 8.25v-1.5m0 1.5c-1.355 0-2.697.056-4.024.166C6.845 8.51 6 9.473 6 10.608v2.513m6-4.871c1.355 0 2.697.056 4.024.166C17.155 8.51 18 9.473 18 10.608v2.513M15 8.25v-1.5m-6 1.5v-1.5m12 9.75-1.5.75a3.354 3.354 0 0 1-3 0 3.354 3.354 0 0 0-3 0 3.354 3.354 0 0 1-3 0 3.354 3.354 0 0 0-3 0 3.354 3.354 0 0 1-3 0L3 16.5m15-3.379a48.474 48.474 0 0 0-6-.371c-2.032 0-4.034.126-6 .371m12 0c.39.049.777.102 1.163.16 1.07.16 1.837 1.094 1.837 2.175v5.169c0 .621-.504 1.125-1.125 1.125H4.125A1.125 1.125 0 0 1 3 20.625v-5.17c0-1.08.768-2.014 1.837-2.174A47.78 47.78 0 0 1 6 13.12M12.265 3.11a.375.375 0 1 1-.53 0L12 2.845l.265.265Zm-3 0a.375.375 0 1 1-.53 0L9 2.845l.265.265Zm6 0a.375.375 0 1 1-.53 0L15 2.845l.265.265Z',
              ),
            ],
          ),
          config.birth,
        ),
        _buildItem(
          svg(
            classes: 'size-5 lg:size-6 fill-none stroke-slate-900',
            viewBox: '0 0 24 24',
            [
              path([], d: 'M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z'),
              path(
                [],
                d: 'M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z',
              ),
            ],
          ),
          config.location,
        ),
        _buildItem(
          svg(
            classes: 'size-5 lg:size-6 fill-none stroke-slate-900',
            viewBox: '0 0 24 24',
            [
              path(
                [],
                d: 'M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75',
              ),
            ],
          ),
          config.mail,
          'mailto:${config.mail}',
        ),
      ],
    );
  }

  Component _buildItem(Component svg, String title, [String? href]) {
    return div(classes: 'flex items-center gap-1 lg:gap-2', [
      svg,
      if (href != null)
        a(
          classes: 'hover:underline',
          [text(title)],
          href: href,
          target: Target.blank,
        )
      else
        span([text(title)]),
    ]);
  }
}
