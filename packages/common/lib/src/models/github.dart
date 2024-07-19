import 'package:dart_mappable/dart_mappable.dart';

part 'github.mapper.dart';

@MappableClass()
class Github with GithubMappable {
  Github({required this.title, required this.user});

  final String title;
  final String user;
}
