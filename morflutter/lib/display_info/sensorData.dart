import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class dataVis extends StatefulWidget {
  const dataVis({super.key});

  @override
  State<dataVis> createState() => _dataVisState();
}

class _dataVisState extends State<dataVis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('Your data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: LineChart(LineChartData(
                titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                        axisNameWidget: Text('Sensor data'),
                        axisNameSize: 20,
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                        axisNameSize: 50,
                        axisNameWidget: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Monday',
                            ),
                            Text('Tuesday'),
                            Text('Wednesday'),
                          ],
                        ))),
                lineBarsData: [
                  LineChartBarData(
                    color: Colors.amber,
                    gradient: LinearGradient(colors: [
                      Colors.purple,
                      Colors.purpleAccent,
                      Colors.black
                    ]),
                    isCurved: true,
                    barWidth: 6,
                    spots: const [
                      // insert your data here:
                      FlSpot(1, 3.8),
                      FlSpot(3, 2.8),
                      FlSpot(7, 1.2),
                      FlSpot(10, 2.8),
                      FlSpot(12, 2.6),
                      FlSpot(13, 3.9),
                    ],
                  ),
                  LineChartBarData(spots: const [
                    FlSpot(0, 1.8),
                    FlSpot(2, 4.8),
                    FlSpot(5, 1.5),
                    FlSpot(9, 2.8),
                  ])
                ])),
          ),
        ),
      ),
    );
  }
}
