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
          'grid grid-cols-1 place-items-center gap-y-1 mt-6 px-6 lg:grid-cols-[14rem_auto] lg:place-items-start lg:gap-x-8 lg:mt-8 lg:px-8',
      [
        div(classes: 'w-56 lg:fixed', [
          img(
            classes: 'size-32 mx-auto object-cover rounded-full lg:size-48',
            src: 'profile.png',
            alt: '프로필 사진',
            loading: MediaLoading.lazy,
          ),
        ]),
        div(classes: 'mx-auto lg:col-start-2', [
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
