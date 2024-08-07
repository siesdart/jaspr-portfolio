import 'package:dart_mappable/dart_mappable.dart';

part 'history.mapper.dart';

@MappableClass()
class History with HistoryMappable {
  History({
    required this.period,
    required this.imageUrl,
    required this.title,
    required this.content,
  });

  final String period;
  final String imageUrl;
  final String title;
  final String content;
}
