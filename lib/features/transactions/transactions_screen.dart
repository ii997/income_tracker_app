import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Transactions',
          style: ShadTheme.of(context).textTheme.h4,
        ),
      ),
    );
  }
}
