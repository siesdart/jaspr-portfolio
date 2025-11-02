import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ui/ui.dart';

class ExperienceItem extends StatelessComponent {
  const ExperienceItem(this.experience, {super.key});

  final Experience experience;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col gap-4', [
      span(
        classes: 'text-gray-400',
        [text(experience.period)],
      ),
      div(classes: 'flex gap-2 lg:gap-4', [
        img(
          classes: 'flex-none size-12',
          src: experience.image,
          alt: '${experience.company} image',
          loading: MediaLoading.lazy,
        ),
        div(classes: 'flex-1 flex flex-col justify-center ml-1', [
          h5(classes: 'font-medium', [text(experience.company)]),
          span(classes: 'font-light', [text(experience.role)]),
          p(
            classes: 'hidden py-4 leading-7 lg:block',
            [MultilineText(experience.description)],
          ),
          span(
            classes: 'hidden font-extralight lg:block text-gray-600',
            experience.tags.map((tag) => text('#$tag ')).toList(),
          ),
        ]),
      ]),
      p(classes: 'leading-7 lg:hidden', [
        MultilineText(experience.description),
      ]),
      span(
        classes: 'font-extralight lg:hidden text-gray-600',
        experience.tags.map((tag) => text('#$tag ')).toList(),
      ),
    ]);
  }
}
