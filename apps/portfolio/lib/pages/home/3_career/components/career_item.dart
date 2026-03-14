import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/tags.dart';

class CareerItem extends StatelessComponent {
  const CareerItem(this.career, {super.key});

  final Career career;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col gap-4', [
      span(
        classes: 'text-muted-foreground',
        [Component.text(career.period)],
      ),
      div(classes: 'flex gap-2 lg:gap-4', [
        img(
          classes: 'flex-none size-12',
          src: career.image,
          alt: '${career.company} image',
          loading: MediaLoading.lazy,
        ),
        div(classes: 'flex-1 flex flex-col justify-center ml-1', [
          h5(classes: 'font-medium', [Component.text(career.company)]),
          span(classes: 'font-light', [Component.text(career.role)]),
          MarkdownArticle(
            classes: 'hidden leading-7 lg:block',
            content: career.content,
          ),
          Tags(
            classes: 'hidden lg:flex',
            career.tags,
          ),
        ]),
      ]),
      MarkdownArticle(
        classes: 'leading-7 lg:hidden -my-4',
        content: career.content,
      ),
      Tags(classes: 'lg:hidden', career.tags),
    ]);
  }
}
