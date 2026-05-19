import 'package:dart_mappable/dart_mappable.dart';

part 'site.mapper.dart';

@MappableClass()
class Site with SiteMappable {
  Site({required this.title, required this.url, this.icon});

  final String title;
  final String url;
  final String? icon;
}
