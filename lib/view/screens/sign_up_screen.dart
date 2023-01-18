import 'package:flutter/material.dart';
import 'package:muet_ez/constants/app_colors.dart';

import '../../constants/constants.dart';
import '../../routes.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height * 0.75,
              decoration: const BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(
                      'assets/images/muet_logo.png',
                      width: getDeviceSize(context).width,
                      height: 160,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      width: getDeviceSize(context).width,
                      height: getDeviceSize(context).height * 0.75,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                          ),
                          Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          hintText: 'Username',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17)),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17)),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors.green,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        ),
                                        hintText: 'Password',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      ),
                                      obscureText: _passwordVisible,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Forget password?',
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 15),
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24)))),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(140, 44)),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.green)),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 17),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: AppColors.white, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.signInScreen);
                          },
                          child: const Text(
                            'Sign In',
                            style:
                                TextStyle(color: AppColors.green, fontSize: 15),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
