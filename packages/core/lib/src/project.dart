import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'project.mapper.dart';

@MappableClass()
class Project with ProjectMappable {
  Project({
    required this.id,
    required this.title,
    required this.introduction,
    required this.year,
    required this.order,
    required this.repo,
    required this.color,
    required this.image,
    required this.tags,
    required this.files,
    required this.content,
  });

  final String id;
  final String title;
  final String introduction;
  final int year;
  final int order;
  final String? repo;
  final String color;
  final String? image;
  final List<String> tags;
  final List<File>? files;
  final String content;

  @decoder
  static Project fromJson(String json) => ProjectMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}

extension ProjectCollection on List<Project> {
  List<MapEntry<int, List<Project>>> groupByYear() {
    return groupBy(
      this,
      (project) => project.year,
    ).entries.sorted((a, b) => b.key.compareTo(a.key));
  }

  List<Project> sortedByOrder() {
    return sorted((a, b) => b.order.compareTo(a.order));
  }

  List<Project> sortedByYearAndOrder() {
    return sorted((a, b) {
      final c = b.year.compareTo(a.year);
      return c == 0 ? b.order.compareTo(a.order) : c;
    });
  }
}
