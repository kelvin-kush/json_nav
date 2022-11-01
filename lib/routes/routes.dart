import 'package:flutter/material.dart';
import 'package:navigation_drawer/main.dart';
import 'package:navigation_drawer/pages/login.dart';
import 'package:navigation_drawer/pages/mainpage.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String mainPage = '/mainPage';
  static const String settingsPage = '/settingsPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );

      case mainPage:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );

     

      default:
        throw FormatException('Route not found! Check routes again!');
    }
  }
}
