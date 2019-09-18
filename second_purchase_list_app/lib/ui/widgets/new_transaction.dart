import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactionHandler;

  NewTransaction({this.addNewTransactionHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitTransactionData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final tsInputTitle = _titleController.text;
    final tsInputAmount = double.parse(_amountController.text);

    if (tsInputAmount <= 0 || tsInputTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addNewTransactionHandler(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choosen'
                            : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveButton(
                      showDatePicker: _showDatePicker,
                      text: 'Choose Date',
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
      ),
    );
  }
}
