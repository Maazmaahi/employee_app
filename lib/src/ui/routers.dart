import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

const String initialRoute = "/";

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash': return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/': return MaterialPageRoute(builder: (_) => HomeScreen());
//      case 'post':
//        var post = settings.arguments as Post;
//        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}