/// Combines classes using [clsx] and then merges them using [twMerge].
String cn(List<dynamic> args) => twMerge(clsx(args));

/// Combines class names from various inputs (strings, lists, maps) into a single string.
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

/// A simplified version of tailwind-merge that resolves basic Tailwind CSS class conflicts.
String twMerge(String classes) {
  if (classes.isEmpty) return '';

  final classList = classes
      .split(RegExp(r'\s+'))
      .where((c) => c.isNotEmpty)
      .toList();
  final merged = <String, String>{};

  for (final className in classList) {
    final key = _getConflictKey(className);
    merged[key] = className;
  }

  return merged.values.join(' ');
}

String _getConflictKey(String className) {
  final parts = className.split(':');
  final modifier = parts.length > 1
      ? '${parts.sublist(0, parts.length - 1).join(':')}:'
      : '';
  final baseClass = parts.last;

  final segments = baseClass.split('-');
  if (segments.isEmpty) return className;

  final prefix = segments.sublist(0, segments.length - 1).join('-');

  // Layout & Position
  if (const ['flex', 'grid', 'block', 'inline', 'hidden'].contains(baseClass)) {
    return '${modifier}display';
  }
  if (const [
    'absolute',
    'relative',
    'fixed',
    'sticky',
    'static',
  ].contains(baseClass)) {
    return '${modifier}position';
  }

  // Border properties
  if (baseClass == 'border') {
    return '${modifier}border-width';
  }
  if (segments.first == 'border' && segments.length > 1) {
    final val = segments[1];
    if (int.tryParse(val) != null ||
        const [
          'x',
          'y',
          's',
          'e',
          'bs',
          'be',
          't',
          'r',
          'b',
          'l',
        ].contains(val)) {
      return '${modifier}border-width';
    }
    if (const [
      'solid',
      'dashed',
      'dotted',
      'double',
      'hidden',
      'none',
    ].contains(val)) {
      return '${modifier}border-style';
    }
    return '${modifier}border-color';
  }

  // Text properties (Size and Weight)
  if (prefix == 'text' && segments.length > 1) {
    final val = segments[1];
    if (const [
      'xs',
      'sm',
      'base',
      'lg',
      'xl',
      '2xl',
      '3xl',
      '4xl',
      '5xl',
      '6xl',
      '7xl',
      '8xl',
      '9xl',
    ].contains(val)) {
      return '${modifier}text-size';
    }
    if (const [
      'thin',
      'extralight',
      'light',
      'normal',
      'medium',
      'semibold',
      'bold',
      'extrabold',
      'black',
    ].contains(val)) {
      return '${modifier}text-weight';
    }
  }

  return '$modifier$prefix';
}
