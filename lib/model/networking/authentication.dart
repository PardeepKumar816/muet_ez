

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import '../../constants/constants.dart';

import '../../routes.dart';

class Auth{
  static final Config config = Config(
    tenant: FlutterConfig.get('TENAT'),
    clientId: FlutterConfig.get('CLIENT_ID'),
    scope: "openid profile offline_access",
    // redirectUri is Optional as a default is calculated based on app type/web location
    redirectUri: FlutterConfig.get('REDIRECT_URI'),
    navigatorKey: navigatorKey,
    webUseRedirect: true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    loader: const Center(child: CircularProgressIndicator()),
    postLogoutRedirectUri: FlutterConfig.get('POST_LOGOUT_URI'), //optional
  );
  static final AadOAuth oauth = AadOAuth(config);



  static Future<dynamic> loginWithMicrosoft() async {
    try {
      await oauth.login().then((value) async {
        value.fold(
              (Failure failure) {
            // Auth failed, show error
            if (kDebugMode) {
              print(failure.message);
            }
            throw Exception('Login failed: ${failure.message}');
          },
              (Token token) async {
            if (token.accessToken == null) {
              // print(token.accessToken);
              if (kDebugMode) {
                print("error on token");
              }
              throw Exception('Error on token');
            }

            // Handle successful login
            if (kDebugMode) {
              print('Logged in successfully, your access token: ${token.accessToken!}');

              await getSharedPreferencesInstance().then((value){value.setString("token", token.accessToken!);});
            }
          },
        );
      });
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
      return err;
    }
  }

  static Future<void> logout(BuildContext context)async{
    await oauth.logout().then((value) async {
      await getSharedPreferencesInstance().then((value){value.remove("token");});
      Navigator.pushReplacementNamed(context, Routes.signInScreen);
    }).catchError((err){if (kDebugMode) {print(err.toString());}});
  }

  // static void getUserInfo(String accessToken) async {
  //   print(accessToken);
  //   final response = await http.get(
  //     Uri.parse('https://graph.microsoft.com/v1.0/me'),
  //    // Uri.parse('https://graph.microsoft.com/v1.0/email'),
  //     headers: {
  //       'Authorization': 'Bearer $accessToken',
  //     },
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var userInfo = jsonDecode(response.body);
  //     print('User ID: ${userInfo['id']}');
  //     print('User Name: ${userInfo['displayName']}');
  //     print('User Email: ${userInfo['mail'] ?? userInfo['userPrincipalName']}');
  //   } else {
  //     print('Failed to get user info');
  //   }
  // }


}