import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/config.dart';

class Header extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;
    final index = config.title.indexOf('.');
    yield header(
      classes:
          'flex flex-col items-center gap-1 pt-8 px-8 lg:flex-row lg:gap-16',
      [
        div(classes: 'flex-none w-56 lg:fixed lg:top-8', [
          img(
            classes:
                'w-32 h-32 mx-auto object-cover rounded-full lg:w-48 lg:h-48',
            src: 'profile.png',
            alt: '프로필 사진',
            loading: MediaLoading.lazy,
          ),
        ]),
        div(classes: 'flex-none w-0 lg:w-56', []),
        div(classes: 'flex-none mx-auto', [
          h2(classes: 'font-semibold text-4xl text-[#1967D2] lg:text-7xl', [
            text('(${config.title.substring(0, index)}'),
            span(
              classes: 'text-[#13B9FD]',
              [text('${config.title.substring(index)})')],
            ),
          ]),
          h3(
            classes:
                'font-light text-center text-gray-500 mt-1 lg:text-end lg:text-xl lg:mt-2',
            [text(config.description)],
          ),
        ]),
      ],
    );
  }
}
