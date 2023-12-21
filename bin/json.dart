import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('json', "A dart implementation of json convert to model")
    ..addCommand(BuildCommand())
    ..run(arguments);
}

class BuildCommand extends Command {
  @override
  String get description => "build dart run build_runner build";

  @override
  String get name => "build";

  BuildCommand() {
    argParser.addOption(
      'host',
      abbr: 'o',
      help: 'It\'s a http uri(eg:http://www.google.com/api).',
    );
    argParser.addOption(
      'token',
      abbr: 't',
      help: 'It\'s a http header authorization value',
    );
  }

  @override
  FutureOr? run() async {
    final host = argResults?['host'] ?? "";
    final token = argResults?['token'] ?? "";
    print(host);
    print(token);
    await Process.run('dart', [
      'run',
      'build_runner',
      "build",
      "-d",
      "--define",
      "json_parse_model:json=host=$host",
      "--define",
      "json_parse_model:json=token=$token"
    ]);
  }
}
