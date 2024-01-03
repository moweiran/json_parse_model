import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

import 'build_config.dart';
import 'builder.dart';

Future<JsonBuildConfig> loadConfigs() async {
  jlogger.info('start load config');
  final File file = File.fromUri(Uri.file("json2model.yaml"));
  if (await file.exists()) {
    final config = await file.readAsString();
    final doc = loadYaml(config);
    final jsonString = json.encode(doc);
    return JsonBuildConfig.fromJson(json.decode(jsonString));
  } else {
    jlogger
        .info("Environment variable file doesn't exist at `json2model.yaml`.");
    return JsonBuildConfig(host: '', token: '');
  }
}
