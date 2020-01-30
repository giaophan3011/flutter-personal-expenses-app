import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function handlePress;

  NewTransaction(this.handlePress);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: TextInputType.number,
        ),
        FlatButton(
            child: Text('Add transaction'),
            onPressed: () {
              handlePress(
                amountController.text,
                titleController.text,
              );
            }),
      ]),
    );
  }
}
