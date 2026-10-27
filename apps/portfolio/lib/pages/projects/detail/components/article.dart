import 'package:core/core.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/markdown_article.dart';
import 'package:portfolio/components/tags.dart';
import 'package:portfolio/pages/projects/detail/components/header.dart';
import 'package:ui/ui.dart';

class ProjectArticle extends StatelessComponent {
  const ProjectArticle({required this.project, super.key});

  final Project project;

  @override
  Component build(BuildContext context) {
    return article(classes: 'flex flex-col gap-2 max-w-full', [
      ProjectHeader(project: project),
      Tags(project.tags),
      if (project.image != null)
        figure([
          Image(
            classes: 'max-h-96 w-full object-contain mt-4',
            src: project.image!,
            alt: '${project.title} image',
            attributes: const {'fetchpriority': 'high'},
          ),
        ]),
      MarkdownArticle(content: project.content),
    ]);
  }
}
