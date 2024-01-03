import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'build_config.dart';
import 'builder.dart';
import 'load_config.dart';

class HttpParse {
  HttpParse._();
  static final instance = HttpParse._();
  JsonBuildConfig? buildConfig;
  Future<Map<String, dynamic>?> get(
    String api, {
    String? host,
    String? token,
  }) async {
    try {
      if (host != null &&
          host.isNotEmpty &&
          token != null &&
          token.isNotEmpty) {
        jlogger.info('read buid config from options');
        buildConfig = JsonBuildConfig(host: host, token: token);
      } else {
        jlogger.info('read buid config from yaml file');
        buildConfig ??= await loadConfigs();
      }

      if (buildConfig!.host.isEmpty || buildConfig!.token.isEmpty) {
        return {};
      }
      final String url = '${buildConfig!.host}/$api';
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${buildConfig!.token}',
      });
      // logger.info('$url =>\n ${response.body}');
      jlogger.info('$url =>\n ${response.body}');
      return json.decode(response.body);
    } catch (e, s) {
      jlogger.error('httpParse$e $s');
      return null;
    }
  }
}
