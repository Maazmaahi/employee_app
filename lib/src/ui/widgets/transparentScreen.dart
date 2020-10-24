import 'package:employee_app/src/ui/shared/constants.dart';
import 'package:flutter/material.dart';

class TransparentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black.withOpacity(0.0),
          ),
        ),
      ],
    );
  }
}

class TransparentScreenWithLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black.withOpacity(0.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colour.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
