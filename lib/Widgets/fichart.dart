import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartPageState();
}

class BarChartPageState extends State<BarChartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      decoration: BoxDecoration(
        color: Provider.of<FitnessData>(context).isDarkModeOn
            ? Color(0xFF000099)
            : Colors.white,
        borderRadius: new BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            child: BarChart(
              mainBarData(),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    Color barColor = Colors.blueAccent,
    double width = 12,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          color: barColor,
          width: width,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            color: Colors.blue[50],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5);
          case 1:
            return makeGroupData(1, 7.5);
          case 2:
            return makeGroupData(2, 3);
          case 3:
            return makeGroupData(3, 10.5);
          case 4:
            return makeGroupData(4, 15);
          case 5:
            return makeGroupData(5, 12);
          case 6:
            return makeGroupData(6, 6.5);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Sun';
              case 1:
                return 'Mon';
              case 2:
                return 'Tue';
              case 3:
                return 'Wed';
              case 4:
                return 'Thu';
              case 5:
                return 'Fri';
              case 6:
                return 'Sat';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
