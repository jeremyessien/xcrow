import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset('images/Xcrow Logo.png', height: 120, width: 120,),
              Text('Welcome to X-crow', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: BrandColors.colorPrimary),),
            ],
          ),
        ),
      ),
    );
  }
}
