import 'dart:io';

/// Flutter Launcher Icons Logger
class JLogger {
  /// Logs error messages
  void error(Object? message) {
    stderr.writeln('⚠️$message');
    // stderr.flush();
  }

  /// Prints to console
  void info(Object? message) {
    stdout.writeln(message.toString());
    // stdout.flush();
  }
}
