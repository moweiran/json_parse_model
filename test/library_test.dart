import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  useDartfmt();
  test('should emit a source file with manual imports', () {
    final m = DartEmitter(orderDirectives: true);
    final lib = Library((b) =>
        b..directives.add(Directive.import('package:flutter/foundation.dart')));
    final s = lib.accept(m);
    final result = DartFormatter().format('$s');
    print(result);
  });
}
