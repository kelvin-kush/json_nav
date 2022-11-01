import 'package:flutter/material.dart';
import 'package:navigation_drawer/models/news.dart';
import 'package:navigation_drawer/models/user.dart';
import 'package:navigation_drawer/pages/stories.dart';
import 'package:navigation_drawer/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UserData())),
        ChangeNotifierProvider(
          create: (context) => NewsData(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          initialRoute: RouteManager.loginPage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );

    // MaterialApp(
    //   home: ChangeNotifierProvider(
    //       create: (context) => NewsData(),
    //       builder: (context, child) {
    //         return Stories();
    //       }),
    // );
  }
}
