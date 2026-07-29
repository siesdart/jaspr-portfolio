import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/tags.dart';
import 'package:ui/ui.dart';

class CareerItem extends StatelessComponent {
  const CareerItem(this.career, {super.key});

  final Career career;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex flex-col gap-2', [
      div(classes: 'flex gap-2 lg:gap-3', [
        Image(
          classes: 'flex-none aspect-square size-12',
          src: career.image,
          alt: '${career.company} image',
        ),
        div(classes: 'flex-1 flex flex-col justify-center ml-1', [
          h3(classes: 'font-medium', [.text(career.company)]),
          span(classes: 'font-light', [.text(career.role)]),
          span(
            classes: 'text-muted-foreground',
            [.text(career.period)],
          ),
        ]),
      ]),
      MarkdownArticle(
        classes: 'leading-7 -my-4',
        content: career.content,
      ),
      Tags(classes: 'mt-1', career.tags),
    ]);
  }
}
