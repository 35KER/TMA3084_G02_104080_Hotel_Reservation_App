import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservation_app/validators.dart';

void main() {
  group('validateName', () {
    test('rejects null', () {
      expect(validateName(null), 'Please enter your name');
    });

    test('rejects an empty or blank name', () {
      expect(validateName(''), 'Please enter your name');
      expect(validateName('   '), 'Please enter your name');
    });

    test('rejects a name with fewer than 3 characters', () {
      expect(validateName('Al'), 'Name must have at least 3 characters');
    });

    test('accepts a name with 3 or more characters', () {
      expect(validateName('Ali'), isNull);
      expect(validateName('  Siti Aminah  '), isNull);
    });
  });
}
