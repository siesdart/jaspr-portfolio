import 'package:jaspr/jaspr.dart';

class Skill extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield _buildSkill();
    yield ul(classes: 'list-disc ml-4 space-y-1', [
      li([text('언어: C#, Dart, TypeScript 등')]),
      li([text('모바일: Flutter')]),
      li([text('데스크톱: WPF, Flutter')]),
      li([text('인공지능: ML.NET')]),
      li([
        text('웹'),
        ul(classes: 'list-dash ml-4 mt-1 space-y-1', [
          li([text('프론트엔드: Svelte, Jaspr, Tailwind CSS')]),
          li([text('백엔드: Express, Firebase, Microsoft Azure')]),
          li([text('데이터베이스: PostgreSQL, MongoDB, Drizzle ORM')]),
        ]),
      ]),
    ]);
  }

  Component _buildSkill() {
    final csharp = [
      div(
        classes:
            'absolute top-28 left-[calc(50%-1.25rem)] lg:top-48 lg:left-[calc(50%-2.5rem)]',
        [_buildIcon('csharp/csharp-original.svg', 'csharp icon')],
      ),
      div(
        classes:
            'absolute top-14 left-[calc(50%-1.25rem)] lg:top-24 lg:left-[calc(50%-2.5rem)]',
        [_buildIcon('icons/wpf.png', 'wpf icon', false)],
      ),
      div(
        classes: 'absolute left-[calc(50%-1.25rem)] lg:left-[calc(50%-2.5rem)]',
        [
          _buildIcon('icons/mldotnet.png', 'ml.net icon', false),
        ],
      ),
    ];
    final ts = [
      div(
        classes:
            'absolute top-[9.5rem] left-[calc(50%-3.75rem)] lg:top-[17rem] lg:left-[calc(50%-6.5rem)]',
        [_buildIcon('typescript/typescript-original.svg', 'typescript icon')],
      ),
      div(
        classes:
            'absolute top-48 left-[calc(50%-6.25rem)]  lg:top-[22rem] lg:left-[calc(50%-11rem)]',
        [_buildIcon('svelte/svelte-original.svg', 'svelte icon')],
      ),
      div(
        classes:
            'absolute top-[14.5rem] left-[calc(50%-8.75rem)] lg:top-[27rem] lg:left-[calc(50%-15.5rem)]',
        [_buildIcon('express/express-original.svg', 'express icon')],
      ),
    ];
    final dart = [
      div(
        classes:
            'absolute top-[9.5rem] left-[calc(50%+1.25rem)] lg:top-[17rem] lg:left-[calc(50%+1.5rem)]',
        [_buildIcon('dart/dart-original.svg', 'dart icon')],
      ),
      div(
        classes:
            'absolute top-48 left-[calc(50%+3.75rem)] lg:top-[22rem] lg:left-[calc(50%+6rem)]',
        [_buildIcon('flutter/flutter-original.svg', 'flutter icon')],
      ),
      div(
        classes:
            'absolute top-[14.5rem] left-[calc(50%+6.25rem)] lg:top-[27rem] lg:left-[calc(50%+10.5rem)]',
        [_buildIcon('icons/jaspr.png', 'jaspr icon', false)],
      ),
    ];
    final etc1 = [
      div(
        classes:
            'absolute top-16 left-[calc(10%-1.45rem)] lg:top-36 lg:left-[calc(5%-1.25rem)]',
        [_buildIcon('firebase/firebase-plain.svg', 'firebase icon')],
      ),
      div(
        classes:
            'absolute top-16 left-[calc(10%+1.95rem)] lg:top-36 lg:left-[calc(5%+4.75rem)]',
        [_buildIcon('azure/azure-original.svg', 'azure icon')],
      ),
      div(
        classes:
            'absolute top-28 left-[calc(10%+0.25rem)] lg:top-56 lg:left-[calc(5%+1.75rem)]',
        [
          _buildIcon('tailwindcss/tailwindcss-original.svg', 'tailwindcss icon')
        ],
      ),
    ];
    final etc2 = [
      div(
        classes:
            'absolute top-16 right-[calc(10%+1.95rem)] lg:top-36 lg:right-[calc(5%+4.75rem)]',
        [_buildIcon('postgresql/postgresql-original.svg', 'postgresql icon')],
      ),
      div(
        classes:
            'absolute top-16 right-[calc(10%-1.45rem)] lg:top-36 lg:right-[calc(5%-1.25rem)]',
        [_buildIcon('mongodb/mongodb-original.svg', 'mongodb icon')],
      ),
      div(
        classes:
            'absolute top-28 right-[calc(10%+0.25rem)] lg:top-56 lg:right-[calc(5%+1.75rem)]',
        [_buildIcon('icons/drizzle.svg', 'drizzle icon', false)],
      ),
    ];
    return div(classes: 'relative h-72 lg:h-[34rem]', [
      ...csharp,
      ...ts,
      ...dart,
      ...etc1,
      ...etc2,
    ]);
  }

  Component _buildIcon(String icon, String alt, [bool devIcon = true]) {
    return div(
      classes:
          'inline-block bg-gray-100 p-2 rounded-full hover:bg-gray-200 lg:p-4',
      [
        img(
          classes: 'size-8 lg:size-12',
          src: devIcon
              ? 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$icon'
              : icon,
          alt: alt,
          loading: MediaLoading.lazy,
        ),
      ],
    );
  }
}
