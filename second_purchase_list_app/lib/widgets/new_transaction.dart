import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart';

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

  void _showDatePicker(BuildContext cnt) {
    showDatePicker(
      context: cnt,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2000),
    );
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Choosen'),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _showDatePicker(context),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add transaction!'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitTransactionData,
            )
          ],
        ),
      ),
    );
  }
}
