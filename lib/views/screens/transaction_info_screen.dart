import 'package:flutter/material.dart';

class TransactionsInfoScreen extends StatelessWidget {
  static const routeName = 'transaction_info';

  const TransactionsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions info screen'),
      ),
    );
  }
}
