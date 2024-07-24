import 'package:banking_project/domain/entities/movement.dart';
import 'package:banking_project/viewmodels/movements_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

//Using here a Calendar and a BarChart libraries to display balance data on a representative way. 
//Currently isn't implemented the data to be displayed on the BarChart, but it's a good start to implement it (template).

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Movement> movements = [];
  List<Movement> movementsAll = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() async {
    final movementsViewModel =
        Provider.of<MovementsViewModel>(context, listen: false);
    movementsAll = await movementsViewModel.addMovements();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Balance"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TableCalendar(
                  firstDay: DateTime.utc(2024, 7, 1),
                  lastDay: DateTime.utc(2024, 7, 30),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  eventLoader: (day) {
                    return movementsAll
                        .where(
                            (movementsAll) => isSameDay(movementsAll.date, day))
                        .toList();
                  },
                ))
              ],
            ),
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Center(
                        child: Text("TOTAL SPEND : 100€",
                            style: TextStyle(fontSize: 20))),
                    AspectRatio(
                      aspectRatio: 1.2,
                      child: BarChart(BarChartData(
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 10),
                            ]),
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 5),
                            ]),
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 3),
                            ])
                          ],
                          titlesData: const FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true),
                                axisNameWidget: Icon(Icons.alarm),
                              ),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                                axisNameWidget: Icon(Icons.attachment_sharp),
                              )))),
                    ),
                  ],
                )),
          ],
        )));
  }
}
