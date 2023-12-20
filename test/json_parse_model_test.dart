import 'dart:convert';

import 'package:json_parse_model/src/load_config.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('A group of tests', () {
    test('test yaml parse', () {
      var doc = loadYaml("YAML: YAML Ain't Markup Language");
      print(json.encode(doc));
    });

    test('test yaml parse by file', () async {
      final config = await loadConfigs();
      print(config.host);
    });
  });
}
