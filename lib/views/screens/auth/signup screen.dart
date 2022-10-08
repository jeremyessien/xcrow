import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

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
                    color: BrandColors.colorPrimary),
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
                  Checkbox(value: value, onChanged: (bool){
                    setState((){
                      value = !value;
                    });
                  }),
                  const Text(' I agree to '),
                  const TextButton(
                     onPressed: null, child: Text('Terms & Condition', style: TextStyle(color: BrandColors.colorPrimary),))
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
