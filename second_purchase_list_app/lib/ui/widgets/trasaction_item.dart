import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class TramsactionItem extends StatelessWidget {
  const TramsactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
              fit: BoxFit.contain,
              child: Text('\$ ${userTransaction.amount}')),
        ),
      ),
      title: Text(
        userTransaction.title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(userTransaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? FlatButton.icon(
              icon: Icon(Icons.delete),
              textColor: Theme.of(context).errorColor,
              onPressed: () =>
                  deleteTransaction(userTransaction.id),
              label: const Text('Delete'),
            )
          : IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () =>
                  deleteTransaction(userTransaction.id),
            ),
    );
  }
}