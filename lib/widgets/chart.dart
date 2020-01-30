import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;
  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedRecentTransactions {
    return List.generate(7, (index) {
      final workDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      double sum = 0.0;
      for (var t in _recentTransactions) {
        if (t.date.year == workDay.year &&
            t.date.month == workDay.month &&
            t.date.day == workDay.day) {
          sum += t.amount;
        }
      }
      return {'day': DateFormat.E().format(workDay), 'totalAmount': sum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedRecentTransactions);
    var totalAmountForAllDays = 0.0;
    for (var transaction in groupedRecentTransactions) {
      totalAmountForAllDays += transaction['totalAmount'];
    }
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: groupedRecentTransactions.map((transaction) {
            //Text(transaction['totalAmount'] != null ? transaction['totalAmount'].toString() : '')
            double dailyAmount  = transaction['totalAmount'];
            return ChartBar(
                transaction['day'], dailyAmount , dailyAmount / totalAmountForAllDays);
          }).toList(),
        ),
      ),
    );
  }
}
