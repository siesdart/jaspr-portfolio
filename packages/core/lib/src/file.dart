import 'package:dart_mappable/dart_mappable.dart';

part 'file.mapper.dart';

@MappableClass()
class File with FileMappable {
  File({required this.name, required this.src});

  final String name;
  final String src;
}
