import 'package:flutter/material.dart';

class SellersScreen extends StatelessWidget {
  static const routeName = 'sellers_screen';

  const SellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sellers screen'),
      ),
    );
  }
}
