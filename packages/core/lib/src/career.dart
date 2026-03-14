import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'career.mapper.dart';

@MappableClass()
class Career with CareerMappable {
  Career({
    required this.id,
    required this.company,
    required this.role,
    required this.period,
    required this.image,
    required this.tags,
    required this.content,
  });

  final String id;
  final String company;
  final String role;
  final String period;
  final String image;
  final List<String> tags;
  final String content;

  @decoder
  static Career fromJson(String json) => CareerMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}

extension CareerCollection on List<Career> {
  List<Career> sortedByPeriod() {
    return sorted((a, b) => b.period.compareTo(a.period));
  }
}
