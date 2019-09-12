import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';
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

        print('weekDay 가 뭐야? => $weekDay');
        for (var i = 0; i < recentTrasactions.length; i++) {
          // print('For문 들어왔습니다.');
          // print('What is recentTransactions[i]? => ${recentTrasactions[i]}');

          if (recentTrasactions[i].date.day == weekDay.day &&
              recentTrasactions[i].date.month == weekDay.month &&
              recentTrasactions[i].date.year == weekDay.year) {
            print(
                'recentTransactions[i] 와 weekDay => ${recentTrasactions[i].date.day}, ${weekDay.day}');

            print(
                'recentTransactions[i] 와 weekDay => ${recentTrasactions[i].date.month}, ${weekDay.month}');
            totalSum += recentTrasactions[i].amount;
          }
        }

        print(
            'What is DateFormat.E(weekDay)?? => ${DateFormat.E().format(weekDay)}');

        print('How much is totalSum?? => ${totalSum}');

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      }).reversed.toList();

  double get maxSpending =>
      groupedTransactionValues.fold(0.0, (sum, item) => sum + item['amount']);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map((gtv) => Flexible(
                fit: FlexFit.tight,
                    child: ChartBar(
                      label: gtv['day'],
                      spendingAmount: gtv['amount'],
                      spendingPctOfTotal: maxSpending == 0.0
                          ? 0.0
                          : (gtv['amount'] as double) / maxSpending,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
