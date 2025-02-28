import 'package:common/common.dart';
import 'package:common/src/components/multiline_text.dart';
import 'package:jaspr/jaspr.dart';

class ExperienceItem extends StatelessComponent {
  const ExperienceItem(this.experience, {super.key});

  final Experience experience;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex flex-col', [
      div(classes: 'flex gap-2 lg:gap-4', [
        span(
          classes: 'flex-none w-20 text-gray-400 lg:w-20',
          [text(experience.period)],
        ),
        img(
          classes: 'flex-none size-12',
          src: experience.imageUrl,
          alt: '${experience.company} image',
          loading: MediaLoading.lazy,
        ),
        div(classes: 'flex-1 flex flex-col justify-center ml-1', [
          h5(classes: 'font-medium', [text(experience.company)]),
          span(classes: 'font-light', [text(experience.role)]),
          p(
            classes: 'hidden py-4 lg:block',
            [MultilineText(experience.description)],
          ),
          span(
            classes: 'hidden font-extralight lg:block',
            experience.tags.map((tag) => text('#$tag ')).toList(),
          ),
        ]),
      ]),
      p(classes: 'py-4 lg:hidden', [MultilineText(experience.description)]),
      span(
        classes: 'font-extralight lg:hidden',
        experience.tags.map((tag) => text('#$tag ')).toList(),
      ),
    ]);
  }
}
