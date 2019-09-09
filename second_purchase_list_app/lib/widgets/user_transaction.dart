import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      amount: 7.77,
      date: DateTime.now(),
      id: 'Tae1',
      title: 'Seong Test',
    ),
    Transaction(
      amount: 6.54,
      date: DateTime.now(),
      id: 'Tae2',
      title: 'Weekly Test',
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
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
        NewTransaction(
          addNewTransactionHandler: _addNewTransaction,
        ),
        TransactionList(userTransaction: _userTransaction),
      ],
    );
  }
}
