import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  TransactionList({this.userTransaction});
  @override
  Widget build(BuildContext context) {
    var viewSize = MediaQuery.of(context).size;
    return Container(
      height: viewSize.height / 1.75,
      child: userTransaction.isEmpty
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
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Text(
                          '\$: ${userTransaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTransaction[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd('en_US')
                                .format(userTransaction[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
