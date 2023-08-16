class Util {
  static String? emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value)) return '*Enter a valid email';
    return null;
  }

  /// Convert a string to a floating number for use on amount field e.t.c
  static int convertToTextFieldValInt(String value) {
    if (value.isEmpty) {
      return 0;
    }
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    return int.parse(_onlyDigits);
  }

  static double convertToRealNumber(String value) {
    if (value.isEmpty) {
      value = "0";
    }
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    double _doubleValue = double.parse(_onlyDigits);
    if (!value.contains(".")) {
      return _doubleValue;
    }
    return _doubleValue / 100;
  }

  static double amountFieldToDouble(String value) {
    if (value.isEmpty) {
      value = "0";
    }
    String newValue = value.replaceAll(",", "");
    double _doubleValue = double.parse(newValue);
    return _doubleValue;
  }

  static double textFeildFormatter(String value) {
    if (value.isEmpty) {
      value = "0";
    }
    String newValue = value.replaceAll(",", "");
    double _doubleValue = double.parse(newValue);
    return _doubleValue;
  }
}
