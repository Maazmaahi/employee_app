import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  static Size size;

  static showToast({String type = 'success', @required String message}) {
    var bgColor = Colors.green;
    var textColor = Colors.white;
    if (type == 'error') {
      bgColor = Colors.red;
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 12.0);
  }

  static getFirstLetterName({@required String name}) {
    int spaceCheck = name?.indexOf(" ") ?? 0;
    var firstName = spaceCheck > 0 ? name.substring(0, 1) : name?.substring(0, 2);
    var lastName =
        spaceCheck > 0 ? name?.substring(spaceCheck + 1, spaceCheck + 2) : "";
    var n;
    if (spaceCheck > 0) {
      n = firstName + lastName;
    } else {
      n = firstName;
    }
    return n?.toUpperCase();
  }

  static void dismissKeyboard({@required BuildContext ctx}) {
    FocusScopeNode currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
