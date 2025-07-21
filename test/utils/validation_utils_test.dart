import 'package:flutter_test/flutter_test.dart';
import 'package:gsm_pay_task/utils/validation_utils.dart';

void main() {
  group('National Code Validation', () {
    test('Validate national code should return false on repetitive codes', () {
      final testCases = [
        '0000000000',
        '1111111111',
        '2222222222',
        '3333333333',
        '4444444444',
        '5555555555',
        '6666666666',
        '7777777777',
        '8888888888',
        '9999999999',
      ];

      for (final testCase in testCases) {
        final result = ValidationUtil.isValidNationalCode(testCase);
        expect(result, isFalse);
      }
    });

    test(
      'Validate national code should return false on non digit string input (not parsable to int)',
      () {
        final testCases = ['123456789a', '1234567#89'];

        for (final testCase in testCases) {
          final result = ValidationUtil.isValidNationalCode(testCase);
          expect(result, isFalse);
        }
      },
    );

    test(
      'Validate national code should return false on string lenght lower than 10 characters',
      () {
        final testCases = [
          '',
          '1',
          '12',
          '123',
          '1234',
          '12345',
          '123456',
          '1234567',
          '12345678',
          '123456789',
        ];

        for (final testCase in testCases) {
          final result = ValidationUtil.isValidNationalCode(testCase);
          expect(result, isFalse);
        }
      },
    );

    test(
      'Validate national code should return false on non valid national codes',
      () {
        final testCases = [
          '5453626915',
          '9155276600',
          '3500025127',
          '1365574591',
          '5952121889',
          '8255281395',
          '6370988445',
          '9329229939',
        ];

        for (final testCase in testCases) {
          final result = ValidationUtil.isValidNationalCode(testCase);
          expect(result, isFalse);
        }
      },
    );

    test(
      'Validate national code should return true on valid national codes',
      () {
        final testCases = [
          '5453626925',
          '9155276660',
          '3500025137',
          '1365574581',
          '5952121829',
          '8255281355',
          '6370988405',
          '9329229931',
        ];

        for (final testCase in testCases) {
          final result = ValidationUtil.isValidNationalCode(testCase);
          expect(result, isTrue);
        }
      },
    );
  });
}
