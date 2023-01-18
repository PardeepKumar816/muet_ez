import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muet_ez/view/screens/auth_screen.dart';
import 'package:muet_ez/view/screens/home_screen.dart';
import 'package:muet_ez/view/screens/sign_in_screen.dart';
import 'package:muet_ez/view/screens/sign_up_screen.dart';
import 'package:muet_ez/view/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  late Future<bool> loginCheckFuture;

  @override
  void initState() {
    super.initState();
    loginCheckFuture = _checkIfLoggedIn();
  }

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loginCheckFuture,
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const SplashScreen();
          } else if (ConnectionState.done == snapshot.connectionState) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return SignInScreen();
                //  return const HomeScreen();
              } else {
                return SignUpScreen();
              }
            } else {
              return const Center(child: Text('Error Occurs'));
            }
          } else {
            return const Center(child: Text('Error Occurs'));
          }

          // return child;
          //   Scaffold(
          //   body: SafeArea(child: child),
          // );
        });
  }
}
