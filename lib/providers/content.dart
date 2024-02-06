import 'dart:io';

import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:path/path.dart' as p;

final introductionProvider = SyncProvider<String>(
  (ref) async {
    final file = File(p.join('content', 'introduction.md'));
    return file.readAsString();
  },
  id: 'introduction',
);
