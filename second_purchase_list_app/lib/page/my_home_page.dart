import 'package:flutter/material.dart';
import 'package:second_purchase_list_app/widgets/new_transaction.dart';
import 'package:second_purchase_list_app/widgets/user_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatelessWidget {
  final _dateFormat = 'yyyy-MM-dd';

  // String inputTitle;
  // String inputAmount;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Second Flutter APP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Purchase List APP'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () => print('object'),
            )
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
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
            UserTransaction(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
