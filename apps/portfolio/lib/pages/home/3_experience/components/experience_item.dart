import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/tags.dart';

class ExperienceItem extends StatelessComponent {
  const ExperienceItem(this.experience, {super.key});

  final Experience experience;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col gap-4', [
      span(
        classes: 'text-muted-foreground',
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
          Tags(
            classes: 'hidden lg:flex',
            experience.tags,
          ),
        ]),
      ]),
      MarkdownArticle(
        classes: 'leading-7 lg:hidden -my-4',
        content: experience.content,
      ),
      Tags(classes: 'lg:hidden', experience.tags),
    ]);
  }
}
