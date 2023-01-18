import 'package:muet_ez/view/screens/auth_screen.dart';
import 'package:muet_ez/view/screens/home_screen.dart';
import 'package:muet_ez/view/screens/sign_in_screen.dart';
import 'package:muet_ez/view/screens/sign_up_screen.dart';
import 'package:muet_ez/view/screens/splash_screen.dart';

class Routes {
  static String signInScreen = '/SignInScreen';
  static String signUpScreen = '/SignUpScreen';
  static String homeScreen = '/HomeScreen';
  static String authScreen = '/AuthScreen';
  static String splashScreen = '/SplashScreen';

  static getRoutes(context) => {
        Routes.signInScreen: (context) => SignInScreen(),
        Routes.authScreen: (context) => AuthScreen(),
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.signUpScreen: (context) => SignUpScreen(),
        Routes.splashScreen: (context) => SplashScreen(),
      };
}
