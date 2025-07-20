abstract class ValidationUtil {
  static bool isValidNationalCode(String nationalCode) {
    // National code must be not empty
    if (nationalCode.isEmpty) return false;

    // National code must be digits with length of 10
    if (!RegExp(r'^\d{10}$').hasMatch(nationalCode)) return false;

    // Repeated digits are not valid
    if (nationalCode == '0000000000' ||
        nationalCode == '1111111111' ||
        nationalCode == '2222222222' ||
        nationalCode == '3333333333' ||
        nationalCode == '4444444444' ||
        nationalCode == '5555555555' ||
        nationalCode == '6666666666' ||
        nationalCode == '7777777777' ||
        nationalCode == '8888888888' ||
        nationalCode == '9999999999') {
      return false;
    }

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(nationalCode[i]) * (10 - i);
    }

    int controllerDigit = int.parse(nationalCode[9]);
    int remainder = sum % 11;

    if (remainder < 2) {
      return controllerDigit == remainder;
    } else {
      return controllerDigit == (11 - remainder);
    }
  }
}
