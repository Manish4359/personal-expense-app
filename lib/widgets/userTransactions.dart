import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/addNewTransaction.dart';

import '../models/transaction.dart';
import './transactionCard.dart';

class UserTransactions extends StatefulWidget {
  List<Transaction> list;
  Function removeTransaction;

  UserTransactions(
      {Key? key, required this.list, required this.removeTransaction})
      : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ...widget.list.map((tr) => TransactionCard(
                  transactionData: tr,
                  removeTr: widget.removeTransaction,
                )),
          ],
        ),
      ),
    );
  }
}
