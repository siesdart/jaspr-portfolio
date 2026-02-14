import 'package:test/test.dart';
import 'package:ui/ui.dart';

void main() {
  group('clsx', () {
    test('combines strings', () {
      expect(clsx(['a', 'b']), 'a b');
    });

    test('ignores nulls', () {
      expect(clsx(['a', null, 'b']), 'a b');
    });

    test('handles maps', () {
      expect(clsx(['a', {'b': true, 'c': false}]), 'a b');
    });

    test('handles nested lists', () {
      expect(clsx(['a', ['b', 'c']]), 'a b c');
    });
  });

  group('twMerge', () {
    test('merges simple conflicts', () {
      expect(twMerge('p-2 p-4'), 'p-4');
      expect(twMerge('m-2 m-4'), 'm-4');
    });

    test('handles different prefixes', () {
      expect(twMerge('p-2 m-2'), 'p-2 m-2');
    });

    test('handles modifiers', () {
      expect(twMerge('hover:p-2 hover:p-4'), 'hover:p-4');
      expect(twMerge('p-2 hover:p-4'), 'p-2 hover:p-4');
    });

    test('handles text properties', () {
      expect(twMerge('text-sm text-lg'), 'text-lg');
      expect(twMerge('text-sm text-red-500'), 'text-sm text-red-500');
      expect(twMerge('text-bold text-normal'), 'text-normal');
    });

    test('handles position and display', () {
      expect(twMerge('relative absolute'), 'absolute');
      expect(twMerge('flex grid'), 'grid');
    });
  });

  group('cn', () {
    test('combines and merges', () {
      expect(cn(['p-2', {'p-4': true, 'm-2': true}]), 'p-4 m-2');
    });
  });
}
