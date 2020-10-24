import 'package:employee_app/src/ui/shared/constants.dart';
import 'package:flutter/material.dart';

class MessageBox {

  static createAlertDialog(
      {@required BuildContext context,
      @required String msg,
      @required String title,
      @required action}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Text("$msg"),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  Constants.confirm,
                  style: TextStyle(color: Colour.red, fontSize: 20.0),
                ),
                onPressed: action,
              ),
              new FlatButton(
                child: new Text(
                  Constants.close,
                  style: TextStyle(color: Colour.red, fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
