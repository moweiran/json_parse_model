import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  useDartfmt();

  test('should create an extension', () {
    expect(
      Extension((b) => b
        ..name = 'Foo'
        ..on = TypeReference((b) => b.symbol = 'Bar')),
      equalsDart(r'''
        extension Foo on Bar {}
      '''),
    );
  });

  test('test extension generate upcoming', () {
    final emitter = DartEmitter(orderDirectives: true);
    final className = "Upcoming";
    final extensionCode = Extension(
      (b) => b
        ..name = '${className}Ext'
        ..on = TypeReference((b) => b.symbol = className)
        ..methods.add(
          Method(
            (b) => b
              ..name = 'fromJson'
              ..returns = refer(className)
              ..static = true
              ..lambda = true
              ..requiredParameters.add(Parameter((b) => b..name = "e"))
              ..body = Code('$className.fromJson(e)'),
          ),
        )
        ..methods.add(
          Method(
            (b) => b
              ..name = 'fromCompute'
              ..returns = TypeReference(
                (b) => b
                  ..symbol = 'Future'
                  ..types.add(refer(className)),
              )
              ..static = true
              ..lambda = true
              ..requiredParameters.add(Parameter((b) => b..name = "e"))
              ..body = Code('compute(fromJson, e)'),
          ),
        ),
    );
    final extensionFormatterCode =
        DartFormatter().format('${extensionCode.accept(emitter)}');
    // print(extensionFormatterCode);
    equalsDart(r'''
      extension UpcomingExt on Upcoming {
        static Upcoming fromJson(e) => Upcoming.fromJson(e);
        static Future<Upcoming> fromCompute(e) => compute(fromJson, e);
      }
      ''');
  });
}
