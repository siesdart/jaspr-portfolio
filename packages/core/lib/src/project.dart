import 'package:collection/collection.dart';
import 'package:core/src/file.dart';
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
    required this.url,
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
  final String? url;
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
  List<Project> sortedByYearAndOrder() {
    return sorted((a, b) {
      final c = b.year.compareTo(a.year);
      return c == 0 ? b.order.compareTo(a.order) : c;
    });
  }
}
