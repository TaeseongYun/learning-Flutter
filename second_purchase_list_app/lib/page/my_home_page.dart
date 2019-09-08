import 'package:flutter/material.dart';
import 'package:second_purchase_list_app/model/transaction.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> _transcations = [
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Second Flutter APP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Purchase List APP'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text('chart'),
              ),
              elevation: 5,
            ),
            Column(
              children: _transcations
                  .map((tx) => Card(
                        elevation: 4,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Text(
                                tx.amount.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  tx.date.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
