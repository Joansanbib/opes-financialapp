import 'package:banking_project/ui/balance.dart';
import 'package:banking_project/ui/calendar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_js/flutter_js.dart';
import 'dart:convert';
import 'dart:async';
import 'liquid_script.dart' show liquidScript;
import 'gl_script.dart' show glScript;
import 'dark_theme_script.dart' show darkThemeScript;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    // /*24 is for notification bar on Android*/
    // final double itemHeight = size.height - kToolbarHeight;
    // final double itemWidth = size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1, // Adjust this value
                      child: DashboardChart(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.4, // Adjust this value
                      child: InfoChart(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 0.7, // Adjust this value
                      child: NavigationMenu(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class DashboardChart extends StatefulWidget {
  const DashboardChart({Key? key}) : super(key: key);

  @override
  _DashboardChartState createState() => _DashboardChartState();
}

class _DashboardChartState extends State<DashboardChart> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List items = [
      {'color': Colors.amber, 'value': 150.000, 'title': "House"},
      {
        'color': const Color(0xFF637A9F),
        'value': 100.0,
        'title': "Investments"
      },
      {
        'color': const Color(0xFFEE4E4E),
        'value': 10.0,
        'title': "Emergency funds"
      },
    ];
    return Stack(alignment: Alignment.center, children: [
      const Text("Net worth\n\€260.00",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
      PieChart(
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
        PieChartData(
          sections: items.map((item) {
            final isTouched = _touchedIndex == items.indexOf(item);
            return PieChartSectionData(
              value: item['value'],
              color: item['color'],
              radius: isTouched ? 80 : 60,
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: isTouched ? 3 : 1,
              ),
            );
          }).toList(),
          centerSpaceRadius: 100,
          sectionsSpace: 4,
          pieTouchData: PieTouchData(
            touchCallback: (
              FlTouchEvent e,
              PieTouchResponse? r,
            ) {
              if (r != null && r.touchedSection != null) {
                setState(() {
                  _touchedIndex = r.touchedSection!.touchedSectionIndex;
                });
              }
            },
          ),
        ),
      )
    ]);
  }
}

class JsTest extends StatefulWidget {
  const JsTest({Key? key}) : super(key: key);

  @override
  _JsTestState createState() => _JsTestState();
}

class _JsTestState extends State<JsTest> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..enableZoom(false)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
      ),
    )
    ..loadFlutterAsset('assets/pie_chart.html');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WebViewWidget(controller: controller),
    );
  }
}
//   final JavascriptRuntime jsRuntime = getJavascriptRuntime();
//   dynamic result;

//   @override
//   void initState() {
//     super.initState();
//     chartDisplay();
//   }

//   void chartDisplay() async {
//     try {
//       final chartResult = await addJsChart(jsRuntime);
//       setState(() {
//         result = chartResult;
//       });
//     } on PlatformException catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (result == null) {
//       return const CircularProgressIndicator(); // Show loading spinner while waiting for result
//     } else {
//       return Text(result.toString()); // Show result when it's available
//     }
//   }

//   Future<int> addJsChart(JavascriptRuntime jsRuntime) async {
//     String script = await rootBundle.loadString("assets/pie_chart.js");
//     final jsResult = jsRuntime.evaluate(script);
//     final result = jsResult.stringResult;
//     return int.parse(result);
//   }

class InfoChart extends StatefulWidget {
  // ignore: use_super_parameters
  const InfoChart({Key? key}) : super(key: key);

  @override
  _InfoChartState createState() => _InfoChartState();
}

class _InfoChartState extends State<InfoChart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.all(screenWidth * 0.04),
          child: SizedBox(
            width: screenWidth * 0.85,
            height: screenHeight * 0.3,
            child: Card(
              color: Colors.black,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              borderOnForeground: false,
              shadowColor: Colors.grey[100],
              child: const Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'House',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '\€100.00',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Investments',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '\€150.00',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Emergency fund',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '\€10.00',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.all(screenWidth * 0.04),
        //       child: SizedBox(
        //         width: screenWidth * 0.85,
        //         height: screenHeight * 0.1,
        //         child: Card(
        //           color: Colors.white,
        //           elevation: 8,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15.0),
        //           ),
        //           borderOnForeground: false,
        //           shadowColor: Colors.grey[100],
        //           child: const Center(
        //             child: Text('Transactions', style: TextStyle(fontSize: 20.0)),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Balance();
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(screenWidth * 0.04),
                child: SizedBox(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.1,
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    borderOnForeground: false,
                    shadowColor: Colors.grey[100],
                    child: const Center(
                      child: Text('Balance', style: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Balance();
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(screenWidth * 0.04),
                child: SizedBox(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.1,
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    borderOnForeground: false,
                    shadowColor: Colors.grey[100],
                    child: const Center(
                      child: Text('Savings', style: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(screenWidth * 0.04),
              child: SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  borderOnForeground: false,
                  shadowColor: Colors.grey[100],
                  child: const Center(
                    child: Text('Debt', style: TextStyle(fontSize: 20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(screenWidth * 0.04),
              child: SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  borderOnForeground: false,
                  shadowColor: Colors.grey[100],
                  child: const Center(
                    child: Text('Assets', style: TextStyle(fontSize: 20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
