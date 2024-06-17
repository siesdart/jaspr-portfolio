import 'package:dart_mappable/dart_mappable.dart';

part 'project.mapper.dart';

@MappableClass()
class Project with ProjectMappable {
  final String id;
  final String title;
  final String introduction;
  final String description;
  final int year;
  final int order;
  final String? repo;
  final String color;
  final String? image;
  final List<String> tags;

  Project({
    required this.id,
    required this.title,
    required this.introduction,
    required this.description,
    required this.year,
    required this.order,
    required this.repo,
    required this.color,
    required this.image,
    required this.tags,
  });
}
