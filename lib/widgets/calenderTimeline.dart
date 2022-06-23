import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderTimeline extends StatefulWidget {
  Function selectdate;
  CalenderTimeline({Key? key, required this.selectdate}) : super(key: key);

  @override
  State<CalenderTimeline> createState() => _CalenderTimelineState();
}

Container fk(int count, BuildContext context, int day, int month, int year,
    Function selectdate, Function selectday) {
  return Container(
    width: double.infinity,
    height: 50,
    padding: EdgeInsets.all(5),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext, int) => Container(
        //width: 50,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(7)),
        child: GestureDetector(
          child: Text(
            '${int + 1}',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          onTap: () {
            selectday(int + 1);
            selectdate('${month + 1}/${int + 1}/$year');
          },
        ),
      ),
      itemCount: count,
    ),
  );
}

class _CalenderTimelineState extends State<CalenderTimeline> {
  int selectedMonthId = int.parse(DateFormat.M().format(DateTime.now())) - 1;
  int selectedDay = int.parse(DateFormat.d().format(DateTime.now()));
  int selectedYear = 2022;
  List<int> dates = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  late int selectedMonthDays;
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  initState() {
    selectedMonthDays = dates.elementAt(selectedMonthId - 1);
    // widget.selectdate('${selectedMonthId + 1}/${selectedDay}/$selectedYear');
  }

  void selectday(int day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: DropdownButtonFormField(
                isExpanded: true,
                isDense: false,
                value: months[selectedMonthId],
                borderRadius: BorderRadius.circular(5),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                items: months
                    .map<DropdownMenuItem<String>>(
                      (month) => DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: month,
                        child: Container(
                          //height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 79, 144),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          //margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            month,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  for (int i = 0; i < months.length; i++) {
                    if (months[i] == newValue.toString()) {
                      setState(() {
                        selectedMonthId = i;
                        selectedMonthDays = dates[i];
                      });
                      break;
                    }
                  }
                },
              ),
            ),
            Expanded(
                child: Container(
              child: Text(
                '$selectedYear',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(10),
            ))
          ],
        ),
        fk(selectedMonthDays, context, selectedDay, selectedMonthId,
            selectedYear, widget.selectdate, this.selectday),
      ],
    );
  }
}
