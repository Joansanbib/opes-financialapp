import 'package:banking_project/ui/calendar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

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
                    child: Calendar(), // Placeholder for Calendar
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: AspectRatio(
            //         aspectRatio: 1,
            //         child: ChartBalance(),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      );
  }
}

class ChartBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => Colors.blueGrey,
            tooltipHorizontalAlignment: FLHorizontalAlignment.right,
            tooltipMargin: -10,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x) {
                case 0:
                  weekDay = 'Earn';
                  break;
                case 1:
                  weekDay = 'Waste';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                '$weekDay\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
          touchCallback: (FlTouchEvent event, barTouchResponse) {},
        ),
        titlesData: const FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: showingGroups(),
        gridData: const FlGridData(show: false),
      ),
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: index.toDouble() * 2,  // Example data, replace with your actual data
            color: Colors.lightBlueAccent,
            width: 22,
          ),
        ],
        showingTooltipIndicators: [0],
      );
    });
  }
}
