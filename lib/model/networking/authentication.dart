
import 'dart:convert';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http ;

import '../../routes.dart';

class Auth{
  static final Config config = Config(
    tenant: "a26e9a9c-5b10-4fea-8ab0-4aadf76bf729",
    clientId: "a7e33916-f48e-492d-a37a-b99c02d59365",
    scope: "openid profile offline_access",
    // redirectUri is Optional as a default is calculated based on app type/web location
    redirectUri: "https://muet-ez-e5e4a.firebaseapp.com/__/auth/handler",
    navigatorKey: navigatorKey,
    webUseRedirect: true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    loader: const Center(child: CircularProgressIndicator()),
    postLogoutRedirectUri: 'http://your_base_url/logout', //optional
  );
  static final AadOAuth oauth = AadOAuth(config);


  static Future<void> loginWithMicrosoft() async {

    await oauth.login().then((value) async {
      await value.fold(
            (Failure failure) {
          // Auth failed, show error
          if (kDebugMode) {
            print(failure.message);
          }
        },
            (Token token) async {
          if (token.accessToken == null) {
            // print(token.accessToken);
            if (kDebugMode) {
              print("error on token");
            }
            // Handle missing access token, show error or whatever
            return;
          }

          // Handle successful login
          if (kDebugMode) {
            print('Logged in successfully, your access token: ${token.accessToken!}');
            await getSharedPreferencesInstance().then((value){value.setString("token", token.accessToken!);});
          }

          // Perform necessary actions with the access token, such as API calls or storing it securely.

          //    await oauth.logout();
        },
      );
    }).catchError((err){
      if (kDebugMode) {
        print(err.toString());
      }
    });
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