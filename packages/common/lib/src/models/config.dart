import 'package:common/common.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'config.mapper.dart';

@MappableClass()
class Config with ConfigMappable {
  Config({
    required this.title,
    required this.description,
    required this.url,
    required this.locale,
    required this.name,
    required this.github,
    required this.birth,
    required this.location,
    required this.mail,
    required this.experience,
    required this.opensource,
    required this.education,
    required this.award,
    required this.etc,
  });

  final String title;
  final String description;
  final String url;
  final String locale;
  final String name;
  final List<Github> github;
  final String birth;
  final String location;
  final String mail;
  final List<Experience> experience;
  final List<Opensource> opensource;
  final List<History> education;
  final List<History> award;
  final List<History> etc;

  @decoder
  static Config fromJson(String json) => ConfigMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}
