class RegexValidator {
  static bool validatePhone(String? phone) {
    if (phone == null) return false;
    if (phone.length == 0) return false;
    return Paterns.phoneRegex.hasMatch(phone);
  }

  static bool validatePassword(String? password) {
    if (password == null) return false;
    return password.length >= 8 && password.length <= 16;
  }

  static bool validateVerificationCode(String? code) {
    if (code == null) return false;
    return code.length == 6;
  }

  static bool validateName(String? name) {
    if (name == null) return false;
    return name.length >= 3;
  }
}

class Paterns {
  static final RegExp phoneRegex = RegExp(
      r"(^(\+98|98|0|0098)9\d{9}$)|(^(\+\u0669\u0668|\u0669\u0668|\u0660|\u0660\u0660\u0669\u0668)\u0669[\u0660-\u0669]{9}$)|(^(\+\u06f9\u06f8|\u06f9\u06f8|\u06f0|\u06f0\u06f0\u06f9\u06f8)\u06f9[\u06f0-\u06f9]{9}$)");
}
