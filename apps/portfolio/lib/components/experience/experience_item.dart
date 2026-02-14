import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/markdown_article.dart';

class ExperienceItem extends StatelessComponent {
  const ExperienceItem(this.experience, {super.key});

  final Experience experience;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col gap-4', [
      span(
        classes: 'text-gray-400',
        [Component.text(experience.period)],
      ),
      div(classes: 'flex gap-2 lg:gap-4', [
        img(
          classes: 'flex-none size-12',
          src: experience.image,
          alt: '${experience.company} image',
          loading: MediaLoading.lazy,
        ),
        div(classes: 'flex-1 flex flex-col justify-center ml-1', [
          h5(classes: 'font-medium', [Component.text(experience.company)]),
          span(classes: 'font-light', [Component.text(experience.role)]),
          MarkdownArticle(
            classes: 'hidden leading-7 lg:block',
            content: experience.content,
          ),
          span(
            classes: 'hidden font-extralight lg:block text-gray-600',
            experience.tags.map((tag) => Component.text('#$tag ')).toList(),
          ),
        ]),
      ]),
      MarkdownArticle(
        classes: 'leading-7 lg:hidden',
        content: experience.content,
      ),
      span(
        classes: 'font-extralight lg:hidden text-gray-600',
        experience.tags.map((tag) => Component.text('#$tag ')).toList(),
      ),
    ]);
  }
}
