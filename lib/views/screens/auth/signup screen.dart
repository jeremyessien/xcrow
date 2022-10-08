import 'package:flutter/material.dart';
import 'package:xcrow/main_view.dart';
import 'package:xcrow/util/utils/brand_colors.dart';
import 'package:xcrow/util/utils/navigation.dart';
import 'package:xcrow/views/screens/auth/login%20screen.dart';

import '../../../util/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              Image.asset(
                'images/Xcrow Logo.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome to X-crow',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: BrandColors.colorPrimaryDark),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(
                hint: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(hint: 'Email'),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(hint: 'Country'),
              const SizedBox(
                height: 10,
              ),
              DefaultTxtField(
                hint: 'Password',
                obstxt: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                      value: value,
                      onChanged: (bool) {
                        setState(() {
                          value = !value;
                        });
                      }),
                  const Text(' I agree to '),
                  const TextButton(
                      onPressed: null,
                      child: Text(
                        'Terms & Condition',
                        style: TextStyle(color: BrandColors.colorPrimaryDark),
                      ))
                ],
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
                        'Sign up',
                        style: TextStyle(color: BrandColors.colorBackground),
                      ))),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      push(context, LoginScreen());
                    },
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(color: BrandColors.colorPrimaryDark),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
