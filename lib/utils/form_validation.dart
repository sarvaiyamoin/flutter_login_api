class FormValidation {
  static String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Valid Email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  static String? mobileNoValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Mobile Number";
    } else if (value.length < 10) {
      return "Mobile no must be 10 character long";
    }
    return null;
  }

  static String? checkIsEmpty(String? value, String? title) {
    if (value!.isEmpty) {
      return "Please Enter $title";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Pasword";
    } else if (value.length < 6) {
      return "Password must be  6 character long";
    }
    return null;
  }
}
