import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'experience.mapper.dart';

@MappableClass()
class Experience with ExperienceMappable {
  Experience({
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
  static Experience fromJson(String json) => ExperienceMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}

extension ExperienceCollection on List<Experience> {
  List<Experience> sortedByPeriod() {
    return sorted((a, b) => b.period.compareTo(a.period));
  }
}
