import 'package:core/src/career.dart';
import 'package:core/src/opensource.dart';
import 'package:core/src/project.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'content.mapper.dart';

@MappableClass()
class Content with ContentMappable {
  const Content({
    required this.introduction,
    required this.skill,
    required this.careers,
    required this.projects,
    required this.opensources,
  });

  final String introduction;
  final String skill;
  final List<Career> careers;
  final List<Project> projects;
  final List<Opensource> opensources;

  @decoder
  static Content fromJson(String json) => ContentMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}
