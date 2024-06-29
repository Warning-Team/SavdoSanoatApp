abstract class Validate {
  static passportSerialNumber(String serialNumber) {
    // Define the regular expression pattern
    String pattern = r'^[A-Z]{2}\d{7}$';
    // Create a RegExp object
    RegExp regExp = RegExp(pattern);
    // Check if the input string matches the pattern
    return regExp.hasMatch(serialNumber);
  }

  static phone(String phoneNumber) {
    // Define the regular expression pattern
    String pattern = r'^\+998\d{9}$';
    // Create a RegExp object
    RegExp regExp = RegExp(pattern);
    // Check if the input string matches the pattern
    return regExp.hasMatch(phoneNumber);
  }

   static bool isInteger(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = int.tryParse(str);
    return number != null;
  }
  
  static bool isLengthGreaterThanFour(String str) {
    return str.length >= 3;
  }

   static String capitalizeFirstLetter(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str[0].toUpperCase() + str.substring(1);
  }

  
}
