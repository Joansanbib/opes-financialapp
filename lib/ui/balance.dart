import 'package:banking_project/ui/calendar.dart';
import 'package:flutter/material.dart';

//Calling here the Calendar class

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.5,
                    child: Calendar(), 
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}