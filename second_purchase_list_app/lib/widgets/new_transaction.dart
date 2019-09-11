import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactionHandler;

  NewTransaction({this.addNewTransactionHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitTransactionData() {
    final tsInputTitle = _titleController.text;
    final tsInputAmount = double.parse(_amountController.text);

    if (tsInputAmount <= 0 || tsInputTitle.isEmpty) {
      return;
    }

    widget.addNewTransactionHandler(
        _titleController.text, double.parse(_amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              // onChanged: (input) => inputTitle = input,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: _amountController,
              // onChanged: (input) => inputAmount = input,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransactionData(),
            ),
            FlatButton(
              child: Text('Add transaction!'),
              textColor: Colors.purple,
              onPressed: _submitTransactionData,
            )
          ],
        ),
      ),
    );
  }
}
