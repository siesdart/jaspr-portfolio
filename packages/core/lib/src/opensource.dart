import 'package:dart_mappable/dart_mappable.dart';
import 'package:jaspr/jaspr.dart';

part 'opensource.mapper.dart';

@MappableClass()
class Opensource with OpensourceMappable {
  Opensource({
    required this.id,
    required this.repo,
    required this.description,
    required this.role,
    this.contribution,
  });

  final String id;
  final String repo;
  final String description;
  final String role;
  final List<Contribution>? contribution;

  @decoder
  static Opensource fromJson(String json) => OpensourceMapper.fromJson(json);

  @encoder
  @override
  String toJson() => super.toJson();
}

@MappableClass()
class Contribution with ContributionMappable {
  Contribution({
    required this.id,
    required this.description,
    this.title,
  });

  final int id;
  final String? title;
  final String description;
}
