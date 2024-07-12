import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/markdown.dart';
import 'package:portfolio/providers/content.dart';

class Skill extends StatelessComponent with SyncProviderDependencies {
  @override
  // ignore: strict_raw_type
  Iterable<SyncProvider> get preloadDependencies => [skillProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final markdown = context.watch(skillProvider);
    yield _buildSkill();
    yield Markdown(markdown: markdown.valueOrNull ?? '');
  }

  Component _buildSkill() {
    final csharp = [
      div(
        classes:
            'absolute top-28 left-[calc(50%-1.25rem)] lg:top-44 lg:left-[calc(50%-2.5rem)]',
        [_buildIcon('csharp/csharp-original.svg', 'csharp icon')],
      ),
      div(
        classes:
            'absolute top-14 left-[calc(50%-1.25rem)] lg:top-[5.5rem] lg:left-[calc(50%-2.5rem)]',
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
            'absolute top-40 left-[calc(50%-2.98rem)] lg:top-64 lg:left-[calc(50%-5.4rem)]',
        [_buildIcon('typescript/typescript-original.svg', 'typescript icon')],
      ),
      div(
        classes:
            'absolute top-[11.8rem] left-[calc(50%-6.09rem)]  lg:top-[19rem] lg:left-[calc(50%-10.6rem)]',
        [_buildIcon('svelte/svelte-original.svg', 'svelte icon')],
      ),
      div(
        classes:
            'absolute top-[13.6rem] left-[calc(50%-9.2rem)] lg:top-[22rem] lg:left-[calc(50%-15.8rem)]',
        [_buildIcon('express/express-original.svg', 'express icon')],
      ),
    ];
    final dart = [
      div(
        classes:
            'absolute top-40 left-[calc(50%+0.48rem)] lg:top-64 lg:left-[calc(50%+0.4rem)]',
        [_buildIcon('dart/dart-original.svg', 'dart icon')],
      ),
      div(
        classes:
            'absolute top-[11.8rem] left-[calc(50%+3.59rem)] lg:top-[19rem] lg:left-[calc(50%+5.6rem)]',
        [_buildIcon('flutter/flutter-original.svg', 'flutter icon')],
      ),
      div(
        classes:
            'absolute top-[13.6rem] left-[calc(50%+6.7rem)] lg:top-[22rem] lg:left-[calc(50%+10.8rem)]',
        [_buildIcon('icons/jaspr.png', 'jaspr icon', false)],
      ),
    ];
    final etc1 = [
      div(
        classes:
            'absolute top-16 left-[calc(10%-1.45rem)] lg:top-24 lg:left-[calc(5%-1.25rem)]',
        [_buildIcon('firebase/firebase-plain.svg', 'firebase icon')],
      ),
      div(
        classes:
            'absolute top-16 left-[calc(10%+1.95rem)] lg:top-24 lg:left-[calc(5%+4.75rem)]',
        [_buildIcon('azure/azure-original.svg', 'azure icon')],
      ),
      div(
        classes:
            'absolute top-28 left-[calc(10%+0.25rem)] lg:top-44 lg:left-[calc(5%+1.75rem)]',
        [
          _buildIcon('tailwindcss/tailwindcss-original.svg', 'tailwindcss icon')
        ],
      ),
    ];
    final etc2 = [
      div(
        classes:
            'absolute top-16 right-[calc(10%+1.95rem)] lg:top-24 lg:right-[calc(5%+4.75rem)]',
        [_buildIcon('postgresql/postgresql-original.svg', 'postgresql icon')],
      ),
      div(
        classes:
            'absolute top-16 right-[calc(10%-1.45rem)] lg:top-24 lg:right-[calc(5%-1.25rem)]',
        [_buildIcon('mongodb/mongodb-original.svg', 'mongodb icon')],
      ),
      div(
        classes:
            'absolute top-28 right-[calc(10%+0.25rem)] lg:top-44 lg:right-[calc(5%+1.75rem)]',
        [_buildIcon('icons/drizzle.svg', 'drizzle icon', false)],
      ),
    ];
    return div(classes: 'relative h-72 lg:h-[30rem]', [
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
