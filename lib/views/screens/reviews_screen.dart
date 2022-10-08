import 'package:flutter/material.dart';

class ReviewScreens extends StatelessWidget {
  static const routeName = 'reviews_screen';

  const ReviewScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review screens'),
      ),
    );
  }
}
