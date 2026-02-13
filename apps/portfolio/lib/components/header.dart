import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/title.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return const header(
      classes:
          'grid grid-cols-1 place-items-center gap-y-1 px-6 lg:grid-rows-[auto] lg:grid-cols-[14rem_auto] lg:place-items-start lg:gap-x-8 lg:px-8',
      [
        div(classes: 'w-56 lg:fixed lg:top-8 lg:row-start-2 lg:z-20', [
          img(
            classes:
                'size-32 mx-auto object-cover overflow-hidden rounded-full lg:size-48',
            src: 'profile.png',
            alt: 'profile image',
            loading: MediaLoading.lazy,
          ),
        ]),
        Title(classes: 'mx-auto lg:hidden', size: TitleSize.small),
      ],
    );
  }
}
