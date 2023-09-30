import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muet_ez/constants/constants.dart';
import 'package:muet_ez/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'MUET EZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CheckAuth(),
      initialRoute: Routes.splashScreen,
      routes: Routes.getRoutes(context),
    );
  }
}
