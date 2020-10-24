import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String route = "/";

  @override
  Widget build(BuildContext context) {
    return _buildScreen();
  }

  Scaffold _buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      child: Center(
        child: Text('Splash'),
      ),
    );
  }
}
