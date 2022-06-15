import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transactionData;
  Function removeTr;

  TransactionCard({required this.transactionData, required this.removeTr});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 247, 247, 247),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 139, 58, 226),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '₹${transactionData.amount}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 20),
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
          ),
          Container(
            child: ElevatedButton(
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                print(transactionData.id);
                removeTr(transactionData);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
            ),
            margin: EdgeInsets.only(right: 20),
          )
        ],
      ),
    );
  }
}
