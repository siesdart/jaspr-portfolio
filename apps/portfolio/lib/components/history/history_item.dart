import 'package:core/core.dart';
import 'package:jaspr/jaspr.dart';

class HistoryItem extends StatelessComponent {
  const HistoryItem(this.history, {super.key});

  final History history;

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex gap-2 lg:gap-4', [
      span(
        classes: 'flex-none w-20 text-gray-400 lg:w-20',
        [text(history.period)],
      ),
      img(
        classes: 'flex-none size-12',
        src: history.imageUrl,
        alt: '${history.title} image',
        loading: MediaLoading.lazy,
      ),
      div(classes: 'flex-1 flex flex-col justify-center ml-1', [
        h5(classes: 'font-medium', [text(history.title)]),
        p(classes: 'font-light', [text(history.content)]),
      ]),
    ]);
  }
}
