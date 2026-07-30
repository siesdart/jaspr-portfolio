import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart' show Config, ConfigMapper;
import 'package:portfolio/app_data/app_data_loader.dart';
import 'package:portfolio/app_data/app_data_source_exception.dart';
import 'package:yaml/yaml.dart';

class ConfigFileLoader implements AppDataLoader<Config> {
  const ConfigFileLoader(this.file);

  final File file;

  @override
  Future<Config> load() async {
    try {
      final doc = await file.readAsString();
      return ConfigMapper.fromJson(json.encode(loadYaml(doc)));
    } on Object catch (error, stackTrace) {
      throw AppDataSourceException(file.path, error, stackTrace);
    }
  }
}
