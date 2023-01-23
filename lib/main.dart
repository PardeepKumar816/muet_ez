import 'package:flutter/material.dart';
import 'package:muet_ez/routes.dart';
import 'package:muet_ez/view/check_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUET EZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CheckAuth(),
      initialRoute: Routes.homeScreen,
      routes: Routes.getRoutes(context),
    );
  }
}
