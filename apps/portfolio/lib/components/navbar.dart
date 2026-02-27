import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/title.dart';
import 'package:ui/ui.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return const nav(
      classes: 'sticky top-0 z-10 flex flex-col px-4 py-2 bg-background',
      [
        div(
          classes: 'flex justify-end text-lg uppercase',
          [
            NavLink(name: 'About', path: '/'),
            NavLink(name: 'Projects', path: 'projects'),
          ],
        ),
        Title(
          classes: 'ml-56 hidden flex-col self-center lg:flex',
          size: TitleSize.large,
        ),
      ],
    );
  }
}
