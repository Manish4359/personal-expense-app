import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:personal_expenses_app/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transactionData;

  TransactionCard({required this.transactionData});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 247, 247, 247),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 58, 226),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.money,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionData.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text('${DateFormat.yMd().format(transactionData.date)}')
              ],
            ),
          ),
          Expanded(
            child: Text('₹${transactionData.amount}'),
          ),
        ],
      ),
    );
  }
}
