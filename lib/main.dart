import 'package:flutter/material.dart';

import './transaction.dart';
import './transactionCard.dart';
import './addNewCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    Transaction(id: '1', amount: 120000, date: DateTime.now(), title: 'paint'),
    Transaction(id: '2', amount: 56, date: DateTime.now(), title: 'kurkure'),
    Transaction(id: '3', amount: 91, date: DateTime.now(), title: 'lays'),
    Transaction(id: '4', amount: 200, date: DateTime.now(), title: 'chowmin'),
    Transaction(id: '5', amount: 102, date: DateTime.now(), title: 'tea')
  ];

  void addTransaction(Transaction tr) {
    setState(() {
      _transactions.add(tr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Daily Expenses'),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: Column(
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
            Column(
                children: _transactions
                    .map((Transaction transaction) =>
                        TransactionCard(transactionData: transaction))
                    .toList())
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewCard(addToList: addTransaction),
            ),
          );
        },
      ),
    );
  }
}
