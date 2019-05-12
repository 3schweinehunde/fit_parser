import 'package:dart/dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      expect(FitParser().hello_world, "Hello World.");
    });
  });
}
