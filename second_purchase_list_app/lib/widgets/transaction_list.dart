import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  final Function deleteTransaction;

  TransactionList({this.userTransaction, this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No Transaction added yet!!',
                style: Theme.of(context).textTheme.title,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text('\$ ${userTransaction[index].amount}')),
                  ),
                ),
                title: Text(
                  userTransaction[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(userTransaction[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () => deleteTransaction(userTransaction[index].id),
                ),
              ),
            ),
            itemCount: userTransaction.length,
          );
  }
}
