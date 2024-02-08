import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/history.dart';

class HistoryItem extends StatelessComponent {
  final String period;
  final String imageUrl;
  final String title;
  final String content;

  const HistoryItem({
    required this.period,
    required this.imageUrl,
    required this.title,
    required this.content,
  });

  HistoryItem.fromHistory(History history)
      : this(
          period: history.period,
          imageUrl: history.imageUrl,
          title: history.title,
          content: history.content,
        );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex gap-2 lg:gap-4', [
      span(
        classes: 'flex-none w-[4.5rem] text-gray-400 lg:w-20',
        [text(period)],
      ),
      img(
        classes: 'flex-none size-12',
        src: imageUrl,
        loading: MediaLoading.lazy,
      ),
      div(classes: 'flex-1 flex flex-col justify-center ml-1', [
        span(classes: 'font-medium', [text(title)]),
        p(classes: 'font-light', [text(content)]),
      ]),
    ]);
  }
}
