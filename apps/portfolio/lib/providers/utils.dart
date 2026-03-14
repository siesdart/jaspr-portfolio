import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fbh_front_matter/fbh_front_matter.dart' as fm;
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

FutureProvider<String> createFileProvider(String filename) {
  return FutureProvider<String>(
    (ref) async {
      final file = File(p.join('content', filename));
      return file.readAsString();
    },
  );
}

FutureProvider<List<T>> createDirectoryProvider<T>(
  String directoryPath,
  FutureOr<T> Function(String) mapper,
) {
  return FutureProvider<List<T>>(
    (ref) async {
      return Directory(p.join('content', directoryPath))
          .list()
          .where((e) => e is File)
          .cast<File>()
          .asyncMap(
            (e) async => await mapper(
              switch (p.extension(e.path)) {
                '.yaml' => json.encode(
                  loadYaml(await e.readAsString()),
                ),
                '.md' => await () async {
                  final doc = fm.parse(await e.readAsString());
                  return json.encode({
                    ...doc.data,
                    'content': doc.content,
                  });
                }(),
                _ => await e.readAsString(),
              },
            ),
          )
          .toList();
    },
  );
}
