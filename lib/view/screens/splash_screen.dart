import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../constants/app_colors.dart';
import '../../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Welcome',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headline2!
                  //       .copyWith(color: AppColors.white),
                  // ),
                  // const SizedBox(
                  //   height: 32,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                    child: AnimatedBuilder(
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 2 * math.pi,
                          child: Image.asset(
                            'assets/images/muet_logo.png',
                            width: getDeviceSize(context).width / 2.5,
                            height: getDeviceSize(context).height / 2.5,
                          ),
                        );
                      },
                      animation: _controller,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
