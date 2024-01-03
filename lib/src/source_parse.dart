import 'dart:convert';

import 'source_config.dart';

class SourceParse {
  SourceParse._();
  static final instance = SourceParse._();

  JsonSourceConfig parse(String source) {
    final result = (json.decode(source) as Map).cast<String, dynamic>();
    return JsonSourceConfig.fromJson(result);
  }
}
