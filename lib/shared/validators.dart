class Validators {
  static String? mobValid(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? emailValid(String? value) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!);

    if (!emailValid) {
      return 'Please enter valid Email ID';
    }
    return null;
  }

  static String? passlength(String? value) {
    if (value!.length < 6) {
      return 'Password should be more than 6 Characters';
    }
    return null;
  }

  static String? novalid(String? value) {
    return null;
  }
}
