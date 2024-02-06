import 'package:dart_mappable/dart_mappable.dart';
import 'package:portfolio/models/github.dart';
import 'package:portfolio/models/history.dart';

part 'config.mapper.dart';

@MappableClass()
class Config with ConfigMappable {
  final String title;
  final String description;
  final String url;
  final String locale;
  final List<Github> github;
  final String birth;
  final String location;
  final String mail;
  final List<String> project;
  final List<History> education;
  final List<History> award;
  final List<History> etc;

  Config({
    required this.title,
    required this.description,
    required this.url,
    required this.locale,
    required this.github,
    required this.birth,
    required this.location,
    required this.mail,
    required this.project,
    required this.education,
    required this.award,
    required this.etc,
  });
}
