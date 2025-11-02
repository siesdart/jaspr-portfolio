String clsx(List<dynamic> args) {
  final classes = <String>[];
  for (final arg in args) {
    if (arg == null) continue;
    if (arg is String && arg.isNotEmpty) {
      classes.add(arg);
    } else if (arg is List) {
      final nested = clsx(arg);
      if (nested.isNotEmpty) {
        classes.add(nested);
      }
    } else if (arg is Map<String, bool>) {
      for (final entry in arg.entries) {
        if (entry.value) {
          classes.add(entry.key);
        }
      }
    }
  }
  return classes.join(' ');
}
