import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xcrow/main_view.dart';
import 'package:xcrow/util/utils/brand_colors.dart';
import 'package:xcrow/util/utils/image_constants.dart';
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
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        upperBound: 25);
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
        backgroundColor:BrandColors.colorPrimary,
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              xcrowLogoLight,
              width: size.width * 0.8,
              // height: controller.value * 27,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
