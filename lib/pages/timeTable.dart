import 'package:edify/Theme.dart';
import 'package:edify/data/data.dart';
import 'package:edify/services/export.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  final String date;

  const TimeTable({Key key, @required this.date}) : super(key: key);
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    int todayOrder = dayOrderModel.dayorder;
    return Scaffold(
      drawer: Burger(),
      appBar: AppBar(
        title: todayOrder == 0 ? Text('Holiday') : Text('Time Table'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15.8),
          child: Column(
            children: [
              Text('Full Time table'),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(width: 1, color: Colors.blue),
                children: [
                  TableRow(children: [
                    Center(child: Text('Day')),
                    Center(child: Text('1\u1d57\u02b0 Hr')),
                    Center(child: Text('2\u1d57\u02b0 Hr')),
                    Center(child: Text('3\u1d57\u02b0 Hr')),
                    Center(child: Text('4\u1d57\u02b0 Hr')),
                    Center(child: Text('5\u1d57\u02b0 Hr')),
                  ]),
                  TableRow(children: [
                    Text('Day 1'),
                    Text('CC'),
                    Text('SW'),
                    Text('DWH'),
                    Text('BD'),
                    Text('MAD'),
                  ]),
                  TableRow(children: [
                    Text('Day 2'),
                    Text('MAD'),
                    Text('DWH'),
                    Center(child: Text('-')),
                    Center(child: Text('DWH-LAB')),
                    Center(child: Text('-')),
                  ]),
                  TableRow(children: [
                    Text('Day 3'),
                    Text('BD'),
                    Text('MAD'),
                    Text('SEM'),
                    Text('DWH'),
                    Text('CC'),
                  ]),
                  TableRow(children: [
                    Text('Day 4'),
                    Text('CC'),
                    Text('SW'),
                    Center(child: Text('-')),
                    Text('MAD-LAB'),
                    Center(child: Text('  -')),
                  ]),
                  TableRow(children: [
                    Text('Day 5'),
                    Text('CC'),
                    Text('BD'),
                    Text('MAD'),
                    Text('DWH'),
                    Text('SEM'),
                  ]),
                  TableRow(children: [
                    Text('Day 6'),
                    Text('MAD'),
                    Text('DWH'),
                    Text('BD'),
                    Text('SW'),
                    Text('SEM'),
                  ]),
                ],
              ),
              SizedBox(height: 10),
              todayOrder != 0
                  ? Text('Today is Day Order ${todayOrder.toString()}')
                  : Text('Holiday'),
              todayOrder != 0
                  ? Table(
                      border: TableBorder.all(width: 1),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FixedColumnWidth(50),
                      },
                      children: [
                        todayOrder == 1
                            ? TableRow(children: [
                                Text('Day 1'),
                                Text('CC'),
                                Text('SW'),
                                Text('DWH'),
                                Text('BD'),
                                Text('MAD'),
                              ])
                            : todayOrder == 2
                                ? TableRow(children: [
                                    Text('Day 2'),
                                    Text('MAD'),
                                    Text('DWH'),
                                    Center(child: Text('-')),
                                    Text('DWH-LAB'),
                                    Center(child: Text('-')),
                                  ])
                                : todayOrder == 3
                                    ? TableRow(children: [
                                        Text('Day 3'),
                                        Text('BD'),
                                        Text('MAD'),
                                        Text('SEM'),
                                        Text('DWH'),
                                        Text('CC'),
                                      ])
                                    : todayOrder == 4
                                        ? TableRow(children: [
                                            Text('Day 4'),
                                            Text('CC'),
                                            Text('SW'),
                                            Center(child: Text('-')),
                                            Text('MAD-LAB'),
                                            Center(child: Text('-')),
                                          ])
                                        : todayOrder == 5
                                            ? TableRow(children: [
                                                Text('Day 5'),
                                                Text('CC'),
                                                Text('BD'),
                                                Text('MAD'),
                                                Text('DWH'),
                                                Text('SEM'),
                                              ])
                                            : todayOrder == 6
                                                ? TableRow(children: [
                                                    Text('Day 6'),
                                                    Text('MAD'),
                                                    Text('DWH'),
                                                    Text('BD'),
                                                    Text('SW'),
                                                    Text('SEM'),
                                                  ])
                                                : TableRow(children: [
                                                    Center(child: Text('H')),
                                                    Center(child: Text('O')),
                                                    Center(child: Text('L')),
                                                    Center(child: Text('I')),
                                                    Center(child: Text('D')),
                                                    Center(child: Text('A')),
                                                    Center(child: Text('Y'))
                                                  ]),
                        todayOrder == 1
                            ? TableRow(children: [
                                Text('Leature'),
                                Text('Vandana Mam'),
                                Text('Sirisha Mam'),
                                Text('Bharathi Mam'),
                                Text('Nagalakshmi Mam'),
                                Text('Veda sri Mam'),
                              ])
                            : todayOrder == 2
                                ? TableRow(children: [
                                    Text('Leature'),
                                    Text('Veda sri Mam'),
                                    Text('Bharathi Mam'),
                                    Text('-'),
                                    Text('Vandana Mam'),
                                    Text('  -'),
                                  ])
                                : todayOrder == 3
                                    ? TableRow(children: [
                                        Text('Leature'),
                                        Text('Nagalakshmi Mam'),
                                        Text('Veda sri Mam'),
                                        Text('Sirisha Mam'),
                                        Text('Bharathi Mam'),
                                        Text('Vandana Mam'),
                                      ])
                                    : todayOrder == 4
                                        ? TableRow(children: [
                                            Text('Leature'),
                                            Text('Vandana Mam'),
                                            Text('Sirisha Mam'),
                                            Text('-'),
                                            Text('Veda srii Mam'),
                                            Text('  -'),
                                          ])
                                        : todayOrder == 5
                                            ? TableRow(children: [
                                                Text('Leature'),
                                                Text('Vandana Mam'),
                                                Text('Nagalakshmi Mam'),
                                                Text('Veda sri Mam'),
                                                Text('Bharathi Mam'),
                                                Text('Sirisha Mam'),
                                              ])
                                            : todayOrder == 6
                                                ? TableRow(children: [
                                                    Text('Leature'),
                                                    Text('Veda sri Mam'),
                                                    Text('Bharathi Mam'),
                                                    Text('Nagalakshmi Mam'),
                                                    Text('Sirisha Mam'),
                                                    Text('Depends'),
                                                  ])
                                                : TableRow(children: [
                                                    Center(child: Text('H')),
                                                    Center(child: Text('O')),
                                                    Center(child: Text('L')),
                                                    Center(child: Text('I')),
                                                    Center(child: Text('D')),
                                                    Center(child: Text('A')),
                                                    Center(child: Text('Y'))
                                                  ]),
                      ],
                    )
                  : Image.asset('assets/ques.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
