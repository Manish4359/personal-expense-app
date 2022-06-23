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
      clipBehavior: Clip.hardEdge,
      color: Color.fromARGB(255, 247, 247, 247),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              //margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              //height: double,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                //borderRadius: BorderRadius.circular(10),
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
              margin: EdgeInsets.symmetric(horizontal: 10),
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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            onTap: () {
              print(transactionData);
              removeTr(transactionData);
            },
          )
        ],
      ),
    );
  }
}
