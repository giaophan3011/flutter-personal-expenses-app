import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import '../models/transaction.dart';
import './newTransaction.dart';
import './transactionList.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<StatefulWidget> {
  final List<Transaction> _transactionList = [
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.parse("2020-01-29 20:18:04Z"),
    ),
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.now(),
    ),
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.now(),
    ),
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.now(),
    ),
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.now(),
    ),
    Transaction(
      amount: 69.99,
      title: 'New shoes',
      id: '1',
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String amount, String title) {
    print('amount: ' + amount);
    Transaction t = Transaction(
        title: title,
        amount: amount != null ? double.parse(amount) : '',
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      _transactionList.add(t);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactionList
        .where(
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransactions),
            NewTransaction(_addNewTransaction),
            TransactionList(_transactionList),
          ],
        ),
      ),
    );
  }
}
