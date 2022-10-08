import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xcrow/main_view.dart';
import 'package:xcrow/util/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  bool isFirstScreen = false;

  @override
  void initState() {
    // checkFirstScreen();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000), upperBound: 25);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });

    Future.delayed(
      const Duration(seconds: 4),
      () {
        pushReplaceNamed(
          context,
          HomeScreen.routeName,
        );
      },
    );
    super.initState();
  }

  // //!Check Screen
  // Future<void> checkFirstScreen() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool seen = (pref.getBool('seen') ?? false);

  //   if (seen) {
  //     setState(() {
  //       isFirstScreen = true;
  //     });
  //   } else {
  //     setState(() {
  //       isFirstScreen = false;
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff004694),
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.32, sigmaY: 6.2),
                  child: Image.asset(
                    'assets/images/splashBg.png',
                    height: size.height * 0.93,
                    width: size.width,
                    fit: BoxFit.fill,
                    color: Colors.blueGrey[400],
                  ),
                ),
              ),
              Positioned(
                top: controller.value * 0.5,
                left: controller.value * 4.5,
                right: controller.value * 4.5,
                // bottom: controller.value * 0.5,

                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/images/pgmiLogo.jpg'))),
                  width: size.width * 0.4,
                  height: controller.value * 27,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
