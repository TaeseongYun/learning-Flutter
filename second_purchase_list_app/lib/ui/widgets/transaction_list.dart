import 'package:flutter/material.dart';
import '../../models/transaction.dart';
import '../widgets/trasaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  final Function deleteTransaction;

  TransactionList({this.userTransaction, this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    print('Here is Transaction_List build()');
    return userTransaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraint) => Column(
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
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => TransactionItem(
              key: ValueKey(userTransaction[index].id),
              deleteTransaction: deleteTransaction,
              userTransaction: userTransaction[index],
            ),
            itemCount: userTransaction.length,
          );
  }
}
