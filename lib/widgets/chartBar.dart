import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: <Widget>[
          Container(
            height: constraint.maxHeight * 0.1,
            child: FittedBox(
              child: Text(
                spendingAmount.toStringAsFixed(0),
              ),
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.1,
          ),
          Container(
            height: constraint.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
                FractionallySizedBox(
                  heightFactor: 1- spendingPercentageOfTotal,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height: constraint.maxHeight * 0.15,
            child: Text(
              label,
            ),
          ),
        ],
      );
    });
  }
}
