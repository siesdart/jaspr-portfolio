import 'package:jaspr/jaspr.dart';
import 'package:portfolio/models/history.dart';

class HistoryItem extends StatelessComponent {
  final History history;

  const HistoryItem(this.history);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex gap-2 lg:gap-4', [
      span(
        classes: 'flex-none w-[4.5rem] text-gray-400 lg:w-20',
        [text(history.period)],
      ),
      img(
        classes: 'flex-none size-12',
        src: history.imageUrl,
        alt: '${history.title} 이미지',
        loading: MediaLoading.lazy,
      ),
      div(classes: 'flex-1 flex flex-col justify-center ml-1', [
        span(classes: 'font-medium', [text(history.title)]),
        p(classes: 'font-light', [text(history.content)]),
      ]),
    ]);
  }
}
