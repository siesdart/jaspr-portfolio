import 'package:common/common.dart';
import 'package:common/src/components/multiline_text.dart';
import 'package:jaspr/jaspr.dart';

class ExperienceItem extends StatelessComponent {
  const ExperienceItem(this.experience, {super.key});

  final Experience experience;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(classes: 'flex gap-2 lg:gap-4', [
      span(
        classes: 'flex-none w-[4.5rem] text-gray-400 lg:w-20',
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
        p(classes: 'py-4', [MultilineText(experience.description)]),
        span(
          classes: 'font-extralight',
          experience.tags.map((tag) => text('#$tag ')).toList(),
        ),
      ]),
    ]);
  }
}
