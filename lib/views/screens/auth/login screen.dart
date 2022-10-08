import 'package:flutter/material.dart';
import 'package:xcrow/main_view.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

import '../../../util/utils/navigation.dart';
import '../../../util/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 50,),
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
                    push(context, HomeScreen());

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
                        style: TextStyle(color: BrandColors.colorBackground, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
