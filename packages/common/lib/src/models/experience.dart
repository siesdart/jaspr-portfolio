import 'package:dart_mappable/dart_mappable.dart';

part 'experience.mapper.dart';

@MappableClass()
class Experience with ExperienceMappable {
  Experience({
    required this.period,
    required this.imageUrl,
    required this.company,
    required this.role,
    required this.description,
    required this.tags,
  });

  final String period;
  final String imageUrl;
  final String company;
  final String role;
  final String description;
  final List<String> tags;
}
