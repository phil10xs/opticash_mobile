String? validateEmail(String field) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  if (field.isEmpty) {
    return 'Field cannot be empty';
  } else {
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(field)) {
      return null;
    } else {
      return 'Please use a valid email address';
    }
  }
}

String? validatePassword(String field) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  if (field.isEmpty) {
    return 'Password cannot be empty';
  } else {
    if (field.length < 8) {
      return 'Password is too short';
    } else {
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(field)) {
        return null;
      } else {
        return 'Invalid password format';
      }
    }
  }
}

String? validateBVN(String field) {
  if (field.isEmpty) {
    return 'BVN is empty';
  } else {
    if (field.length < 11) {
      return 'Incomplete BVN';
    } else {
      return null;
    }
  }
}

bool validateOtp(String field) {
  if (field.length < 6) return false;
  return true;
}

String? validatePhone(String field) {
  if (field.length < 11) {
    return 'Incomplete phone number';
  } else {
    return null;
  }
}

bool validatePin(String code) {
  if (code.length < 4) return false;
  return true;
}
