import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/title.dart';
import 'package:ui/ui.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'sticky top-0 z-10 flex flex-col py-2 bg-white',
      [
        div(
          classes: 'flex justify-end text-lg uppercase',
          const [
            NavLink(name: 'About', path: '/'),
            NavLink(name: 'Projects', path: 'projects'),
          ],
        ),
        const Title(
          classes: 'ml-56 hidden flex-col self-center lg:flex',
          size: TitleSize.large,
        ),
      ],
    );
  }
}
