import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
          ),
          // titlesData: FlTitlesData(
          //   bottomTitles: SideTitles(
          //     showTitles: true,
          //     getTitles: (value) {
          //       // X軸のラベルを返す処理をここに記述
          //       // valueには0から始まるインデックスが渡されます
          //       switch (value.toInt()) {
          //         case 0:
          //           return 'Jan';
          //         case 1:
          //           return 'Feb';
          //         case 2:
          //           return 'Mar';
          //         // ... 続く月のラベルを追加してください
          //         default:
          //           return '';
          //       }
          //     },
          //   ),
          //   leftTitles: SideTitles(
          //     showTitles: true,
          //   ),
          // ),
          borderData: FlBorderData(
            show: true,
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: false,
              color: Colors.blue,
              barWidth: 4,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
