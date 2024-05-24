import 'package:dart_mappable/dart_mappable.dart';

part 'project.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Project with ProjectMappable {
  @MappableField(key: 'html_url')
  final String url;
  final String fullName;
  final String? description;
  final String lang;
  final String tech;
  final int stargazersCount;
  final int forks;
  final int year;

  Project({
    required this.url,
    required this.fullName,
    required this.description,
    required this.lang,
    required this.tech,
    required this.stargazersCount,
    required this.forks,
    required this.year,
  });
}
