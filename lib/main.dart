import 'package:flutter/material.dart';

import './widgets/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontFamily: 'Lato', fontSize: 20)),
        fontFamily: 'Quicksand',
        scrollbarTheme: ScrollbarThemeData(
          crossAxisMargin: 3,
          mainAxisMargin: 7,
          thickness: MaterialStateProperty.all(5),
          thumbColor:
              MaterialStateProperty.all(Color.fromARGB(255, 56, 56, 56)),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          primary: Color.fromARGB(255, 85, 76, 213),
          secondary: Color.fromARGB(255, 21, 21, 21),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
