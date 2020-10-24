class Validator {
  static String validateEmail(String value) {
//    print("validate email ///////////////////////////////////");
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String validateEmpty(String value) {
//    print("validate empty ///////////////////////////////////");
    if (value.length == 0) {
      return "Field Can't be empty";
    }
    return null;
  }

  static String validateLoginPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password  is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Atleast 1 digit,special case, Capital char required";
    } else {
      return null;
    }
  }

  static String validateMobile(String value) {
//    print("Validate mobile ///////////////////////////////////");
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }


  String validatePassword(String value) {
    String upperCase = '(?=.*[A-Z])';
    String lowerCase = '(?=.*[a-z])';
    String digit = '(?=.*?[0-9])';
    String specialChar = '(?=.*?[!@#\$&*~])';
    String passwordLength = '.{8,}';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    RegExp regExpUpperCase = new RegExp(upperCase);
    RegExp regExpLowerCase = new RegExp(lowerCase);
    RegExp regExpDigit = new RegExp(digit);
    RegExp regExpSpecialChar = new RegExp(specialChar);
    RegExp regExpPasswordLength = new RegExp(passwordLength);

    if (value.length == 0) {
      return "Password  is Required";
    } else if (!regExpUpperCase.hasMatch(value)) {
      return "Atleast one Upper Case Required";
    } else if (!regExpLowerCase.hasMatch(value)) {
      return "Atleast one Lower Case Required";
    } else if (!regExpDigit.hasMatch(value)) {
      return "Atleast one Digit Required";
    } else if (!regExpSpecialChar.hasMatch(value)) {
      return "Atleast one Special Char{@ ,*,# etc} Required";
    } else if (!regExpPasswordLength.hasMatch(value)) {
      return "Password length should be minimum 8 ";
    } else {
      return null;
    }
  }

  static String validatePincode(String value) {
//    print("Validate pincode");
    String digit = '(?=.*?[0-9])';
//    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(digit);
    if (value.length == 0) {
      return 'Please enter pincode';
    } else if (value.length < 6) {
      return 'Please enter valid pincode';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid pincode';
    }
    return null;
  }

  static String validateEmptyEmail(String value) {
//    print("validate email ///////////////////////////////////");
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String validateText(String value) {
//    print("validate empty ///////////////////////////////////");
    if (value.length == 0) {
      return null;
    } else if (value.length < 3) {
      return "Please Enter correct Field.";
    }
    return null;
  }
}
