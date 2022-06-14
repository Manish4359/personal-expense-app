import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

class AddNewCard extends StatefulWidget {
  Function addToList;
  AddNewCard({required this.addToList});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

TextEditingController cardAmount = TextEditingController();
TextEditingController cardtitle = TextEditingController();

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Text('amount'),
            TextField(
              controller: cardAmount,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Text('title'),
            TextField(
              controller: cardtitle,
              keyboardType: TextInputType.name,
            ),
            ElevatedButton(
              onPressed: () {
                print(cardAmount.text);
                print(cardtitle.text);
                Transaction newtr = Transaction(
                  title: cardtitle.text,
                  amount: int.parse(cardAmount.text),
                  date: DateTime.now(),
                  id: '56',
                );
                widget.addToList(newtr);

                Navigator.pop(context);
              },
              child: Text('add expense'),
            ),
          ],
        ));
  }
}
