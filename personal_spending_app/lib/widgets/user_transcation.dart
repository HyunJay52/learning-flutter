import 'package:flutter/material.dart';

import '../models/transcation.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transcation> _userTransaction = [
    Transcation(
      id: 't1',
      title: 'new shoes',
      amount: 43.99,
      date: DateTime.now(),
    ),
    Transcation(
      id: 't1',
      title: 'weekly groceries',
      amount: 20.99,
      date: DateTime.now(),
    ),
  ];

  //
  void _addNewTranscation(String txTitle, double txAmount) {
    final newTx = Transcation(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTranscation),
        TranscationList(_userTransaction),
      ],
    );
  }
}
