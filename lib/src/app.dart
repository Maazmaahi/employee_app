import 'package:flutter/material.dart';

import 'ui/routers.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee App',
      onGenerateRoute: Routers.generateRoute,
      initialRoute: initialRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
