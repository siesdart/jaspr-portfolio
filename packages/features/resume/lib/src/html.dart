import 'package:html/dom.dart';
import 'package:html/parser.dart';

String removeHtml(String str) => parseFragment(str)
    .nodes
    .whereType<Text>()
    .map((e) => e.text)
    .join('\n\n')
    .trim();
