import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

const String hostFlag = 'host';
const String tokenFlag = 'token';
const String verboseFlag = 'verbose';

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
    argParser
      ..addOption(
        hostFlag,
        abbr: 'o',
        help: 'It\'s a http uri(eg:http://www.google.com/api).',
      )
      ..addOption(
        tokenFlag,
        abbr: 't',
        help: 'It\'s a http header authorization value',
      )
      ..addFlag(
        verboseFlag,
        abbr: 'v',
        help: 'Verbose output',
        defaultsTo: false,
      );
  }

  @override
  FutureOr? run() async {
    final host = argResults?['host'] ?? "";
    final token = argResults?['token'] ?? "";
    final result = await Process.run(
      'dart',
      [
        'run',
        'build_runner',
        "build",
        "-d",
        "--define",
        "json_parse_model:json=host=$host",
        "--define",
        "json_parse_model:json=token=$token"
      ],
    );
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  }
}
