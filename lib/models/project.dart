import 'package:dart_mappable/dart_mappable.dart';

part 'project.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Project with ProjectMappable {
  @MappableField(key: 'html_url')
  final String url;
  final String fullName;
  final String? description;
  final int stargazersCount;
  final int forks;
  final int year;
  final DateTime pushedAt;

  Project({
    required this.url,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.forks,
    required this.year,
    required this.pushedAt,
  });
}
