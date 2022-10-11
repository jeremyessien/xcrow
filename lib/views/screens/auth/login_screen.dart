// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:xcrow/main_view.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

import '../../../util/utils/image_constants.dart';
import '../../../util/utils/navigation.dart';
import '../../../util/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                xcrowLogoDark,
                height: 50,
                width: size.width * 0.5,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Log into your account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: BrandColors.colorPrimaryDark),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(hint: 'Email'),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(
                hint: 'Password',
                obstxt: true,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    push(
                      context,
                      const ServicesScreen(),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: BrandColors.colorPrimaryDark,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: BrandColors.colorBackground,
                            fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
