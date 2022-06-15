import 'package:flutter/material.dart';
import './widgets/userTransactions.dart';

import '../models/transaction.dart';
import 'widgets/transactionCard.dart';
import 'widgets/addNewTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = [
    Transaction(id: 0, amount: 12, date: DateTime.now(), title: 'milk'),
    Transaction(id: 1, amount: 120, date: DateTime.now(), title: 'paint'),
    Transaction(id: 2, amount: 56, date: DateTime.now(), title: 'kurkure'),
    Transaction(id: 3, amount: 91, date: DateTime.now(), title: 'lays'),
    Transaction(id: 4, amount: 200, date: DateTime.now(), title: 'chowmin'),
    Transaction(id: 5, amount: 102, date: DateTime.now(), title: 'tea'),
    Transaction(id: 5, amount: 102, date: DateTime.now(), title: 'tea')
  ];

  void _addTransaction(Transaction tr) {
    setState(() {
      _transactions.add(tr);
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
      //backgroundColor: Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Daily Expenses'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              width: double.infinity,
              height: 100,
              child: Text(
                'chart',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          UserTransactions(
            list: this._transactions,
            removeTransaction: this._removeTransaction,
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          elevation: MaterialStateProperty.all(10),
        ),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTransaction(
                  this._addTransaction, this._transactions.length),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
