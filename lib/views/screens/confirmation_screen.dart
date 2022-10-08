import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  static const routeName = 'confirmation_screen';

  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation screen'),
      ),
    );
  }
}
