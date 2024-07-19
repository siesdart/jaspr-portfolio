import 'package:jaspr/jaspr.dart';

class Button extends StatelessComponent {
  const Button({
    required this.label,
    required this.onClick,
    this.disabled = false,
  });

  final String label;
  final VoidCallback onClick;
  final bool disabled;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      classes:
          'inline-block cursor-pointer bg-[#0468D7] font-semibold px-5 py-2 rounded-xl text-center text-white transition duration-200 ease-in-out hover:bg-[#0356B1]',
      [text(label)],
      disabled: disabled,
      onClick: onClick,
    );
  }
}
