import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart' show Config, ConfigMapper;
import 'package:yaml/yaml.dart';

Future<Config> loadConfigFile() async {
  final doc = await File('config.yaml').readAsString();
  return ConfigMapper.fromJson(json.encode(loadYaml(doc)));
}
