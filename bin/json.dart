import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

const String hostFlag = 'host';
const String tokenFlag = 'token';
const String verboseFlag = 'verbose';
const String cleanFlag = 'clean';

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
      )
      ..addFlag(
        cleanFlag,
        abbr: 'c',
        help: 'clean output',
        defaultsTo: false,
      );
  }

  @override
  FutureOr? run() async {
    // stdout.writeln(argResults?.options.toString());
    // stdout.writeln(argResults?.toString());
    final String host = argResults?[hostFlag] ?? "";
    final String token = argResults?[tokenFlag] ?? "";
    final bool verbose = argResults?[verboseFlag] ?? false;
    final bool clean = argResults?[cleanFlag] ?? false;
    // stdout.writeln('host=$host');
    // stdout.writeln('token=$token');
    // stdout.writeln('verbose=$verbose');
    // stdout.writeln('clean=$clean');

    if (clean) {
      final cleanResult =
          await Process.run('dart', ['run', 'build_runner', 'clean']);
      if (verbose) {
        stdout.write(cleanResult.stdout);
        stderr.write(cleanResult.stderr);
      }
    }
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
    if (verbose) {
      stdout.write(result.stdout);
      stderr.write(result.stderr);
    }
  }
}
