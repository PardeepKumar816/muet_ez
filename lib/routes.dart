import 'package:muet_ez/view/screens/admin/home_screen_admin.dart';
import 'package:muet_ez/view/screens/attendance_screen.dart';
import 'package:muet_ez/view/screens/auth_screen.dart';
import 'package:muet_ez/view/screens/challan_screen.dart';
import 'package:muet_ez/view/screens/dinning_screen.dart';
import 'package:muet_ez/view/screens/emergency_screen.dart';
import 'package:muet_ez/view/screens/events_screen.dart';
import 'package:muet_ez/view/screens/home_screen.dart';
import 'package:muet_ez/view/screens/map_screen.dart';
import 'package:muet_ez/view/screens/news_download_screen.dart';
import 'package:muet_ez/view/screens/notification_download_screen.dart';
import 'package:muet_ez/view/screens/notification_screen.dart';
import 'package:muet_ez/view/screens/profile_screen.dart';
import 'package:muet_ez/view/screens/results_screen.dart';
import 'package:muet_ez/view/screens/schedule_screen.dart';
import 'package:muet_ez/view/screens/sign_in_screen.dart';
//import 'package:muet_ez/view/screens/sign_up_screen.dart';
import 'package:muet_ez/view/screens/splash_screen.dart';
import 'package:muet_ez/view/screens/transport_screen.dart';

class Routes {
  static String signInScreen = '/SignInScreen';
  //static String signUpScreen = '/SignUpScreen';
  static String homeScreen = '/HomeScreen';
  static String authScreen = '/AuthScreen';
  static String splashScreen = '/SplashScreen';
  static String challanScreen = 'ChallanScreen';
  static String scheduleScreen = '/ScheduleScreen';
  static String attendanceScreen = '/AttendanceScreen';
  static String resultsScreen = '/ResultsScreen';
  static String notificationScreen = '/NotificationScreen';
  static String profileScreen = '/ProfileScreen';
  static String eventsScreen = '/EventsScreen';
  static String dinningScreen = '/DinningScreen';
  static String transportScreen = '/TransportScreen';
  static String emergencyScreen = '/EmergencyScreen';
  static String notificationDownloadScreen = '/NotificationDownloadScreen';
  static String newsDownloadScreen = '/NewsDownloadScreen';
  static String mapScreen = '/MapScreen';
  static String homeScreenAdmin = '/HomeScreenAdmin';

  static getRoutes(context) => {
        Routes.signInScreen: (context) => SignInScreen(),
        Routes.authScreen: (context) => const AuthScreen(),
        Routes.homeScreen: (context) => const HomeScreen(),
       // Routes.signUpScreen: (context) => SignUpScreen(),
        Routes.splashScreen: (context) => SplashScreen(),
        Routes.challanScreen: (context) => ChallanScreen(),
        Routes.scheduleScreen: (context) => ScheduleScreen(),
    Routes.attendanceScreen: (context)=> AttendanceScreen(),
    Routes.resultsScreen: (context)=> ResultsScreen(),
    Routes.profileScreen: (context)=> ProfileScreen(),
    Routes.notificationScreen: (context)=> NotificationScreen(),
    Routes.eventsScreen:(context)=> EventsScreen(),
    Routes.dinningScreen:(context)=> DinningScreen(),
    Routes.transportScreen:(context)=> TransportScreen(),
    Routes.emergencyScreen: (context)=> EmergencyScreen(),
    Routes.notificationDownloadScreen: (context) => NotificationDownloadScreen(text: '',),
    Routes.newsDownloadScreen : (context) => NewsDownloadScreen(text: '',),
    Routes.mapScreen:(context)=>MapScreen(),
    Routes.homeScreenAdmin:(context) => HomeScreenAdmin(),
      };
}
