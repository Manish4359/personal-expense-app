import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';

import './transactionChart.dart';
import './calenderTimeline.dart';
import './userTransactions.dart';

import '../models/transaction.dart';
import './transactionCard.dart';
import './addNewTransaction.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedDate = '6/2/2022';

  void selectDate(String newDate) {
    setState(() {
      this.selectedDate = newDate;
    });
  }

  Map<String, List<Transaction>> transactions = {
    '6/23/2022': [
      Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'milk')
    ],
    '6/25/2022': [
      Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'dd')
    ],
    '6/2/2022': [
      Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'ff'),
      Transaction(id: 3, amount: 91, date: DateTime.now(), title: 'lays'),
      Transaction(id: 4, amount: 200, date: DateTime.now(), title: 'chowmin'),
      Transaction(id: 5, amount: 102, date: DateTime.now(), title: 'tea'),
    ],
    '6/18/2022': [
      Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'fvv')
    ],
    '6/24/2022': [
      Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'fvf'),
      Transaction(id: 2, amount: 56, date: DateTime.now(), title: 'kurkure'),
      Transaction(id: 3, amount: 91, date: DateTime.now(), title: 'lays'),
    ],
  };

  List<Transaction> _transactions = [
    Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'milk'),
    Transaction(id: 1, amount: 120, date: DateTime.now(), title: 'paint'),
    Transaction(id: 2, amount: 56, date: DateTime.now(), title: 'kurkure'),
    Transaction(id: 3, amount: 91, date: DateTime.now(), title: 'lays'),
    Transaction(id: 4, amount: 200, date: DateTime.now(), title: 'chowmin'),
    Transaction(id: 5, amount: 102, date: DateTime.now(), title: 'tea'),
  ];

  void _addTransaction(Transaction tr) {
    setState(() {
      _transactions.insert(0, tr);
    });
  }

  void _removeTransaction(Transaction tr) {
    setState(() {
      _transactions.remove(tr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Text(
                  'Chart',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chart(this._transactions)));
                },
              )
            ],
          ),
        ),
      ),
      //backgroundColor: Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        //backgroundColor: Colors.black,
        title: Text(
          'Daily Expenses',
          style: TextStyle(),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'it1',
                child: Text('Item 1'),
              ),
              const PopupMenuItem<String>(
                value: 'it1',
                child: Text('Item 2'),
              ),
              const PopupMenuItem<String>(
                value: 'it1',
                child: Text('Item 3'),
              ),
              const PopupMenuItem<String>(
                value: 'it1',
                child: Text('Item 4'),
              ),
            ],
          )
        ],
      ),

      body: Column(
        children: [
          CalenderTimeline(selectdate: this.selectDate),
          this.transactions.containsKey(this.selectedDate)
              ? UserTransactions(
                  //list: this._transactions,
                  list: this.transactions[this.selectedDate] ?? [],
                  removeTransaction: this._removeTransaction,
                )
              : Container(
                  height: 120.0, width: 120.0, child: Text('NO RECORDS!!')),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          elevation: MaterialStateProperty.all(10),
        ),
        child: Icon(Icons.add),
        onPressed: () {
          print(DateFormat.yMd().format(DateTime.now()));

          /*
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTransaction(
                  this._addTransaction, this._transactions.length),
            ),
          );
          */
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
