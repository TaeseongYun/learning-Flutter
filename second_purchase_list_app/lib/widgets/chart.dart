import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrasactions;

  Chart({this.recentTrasactions});

  List<Map<String, Object>> get groupedTransactionValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < recentTrasactions.length; i++) {
          print('What is recentTransactions[i]? => ${recentTrasactions[i]}');
          if (recentTrasactions[i].date.day == weekDay.day &&
              recentTrasactions[i].date.month == weekDay.month &&
              recentTrasactions[i].date.year == weekDay.year) {
            totalSum += recentTrasactions[i].amount;
          }
        }

        print('What is DateFormat.E(weekDay)?? => ${DateFormat.E(weekDay)}');

        print('How much is totalSum?? => ${totalSum}');

        return {
          'day': DateFormat.E(weekDay),
          'amout': totalSum,
        };
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '\$',
                style: Theme.of(context).textTheme.title,
              ),
            ],
          )
        ],
      ),
    );
  }
}
