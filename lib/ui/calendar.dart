import 'package:banking_project/data/implementation/movements_impl.dart';
import 'package:banking_project/domain/entities/movements.dart';
import 'package:banking_project/viewmodels/movements_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Movements> movements = [];
  List<Movements> movementsAll = [];
//   List<Kyc> _getEventsForDay(DateTime day) {
//   return kyc[day] ?? [];
// }

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });

  }



  void loadData() async {
    final movementsViewModel = Provider.of<MovementsViewModel>(context, listen: false);
    movementsAll = await movementsViewModel.addMovements();
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calendar')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TableCalendar(
                  firstDay: DateTime.utc(2024, 6, 1),
                  lastDay: DateTime.utc(2024, 6, 30),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
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
                        .where((movementsAll) =>
                            isSameDay(movementsAll.date, day))
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
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: movementsAll.length,
                  itemBuilder: (context, index) {
                    if (isSameDay(movementsAll[index].date, _selectedDay)) {
                      return ListTile(
                        title: Text(
                          movementsAll[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          '${movementsAll[index].amount}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        )));
  }
}
