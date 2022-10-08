import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home screen'),
      // ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [Image.asset('')],
        ),
      ),
    );
  }
}
