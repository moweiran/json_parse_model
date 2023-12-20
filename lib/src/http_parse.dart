import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'build_config.dart';
import 'load_config.dart';

class HttpParse {
  HttpParse._();
  static final instance = HttpParse._();
  JsonBuildConfig? buildConfig;
  Future<Map<String, dynamic>> get(String api) async {
    buildConfig ??= await loadConfigs();
    if (buildConfig!.host.isEmpty || buildConfig!.token.isEmpty) {
      return {};
    }
    final String url = '${buildConfig!.host}/$api';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Bearer ${buildConfig!.token}',
    });
    print(response.body);
    return json.decode(response.body);
  }
}
