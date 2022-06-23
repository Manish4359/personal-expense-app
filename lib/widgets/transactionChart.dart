import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:personal_expenses_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> list;
  Chart(this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: SfCircularChart(
            series: [
              PieSeries(
                dataSource: [1, 2, 3, 4],
              )
            ],
          ),
        ),
      ),
    );
  }
}
