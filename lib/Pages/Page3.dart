import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';

import 'package:fitness_provider/Widgets/circularstar.dart';
import 'package:fitness_provider/Widgets/fichart.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fitness_provider/Widgets/timeseries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  // List<charts.Series<FitnessData, String>> _seriesData;
  @override
  void initState() {
    super.initState();
    // _seriesData = List<charts.Series<FitnessData, String>>();
  }
  

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
      final data = [
        new TimeSeriesSales(new DateTime(2017, 9, 1), 5),
        new TimeSeriesSales(new DateTime(2017, 9, 2), 5),
        new TimeSeriesSales(new DateTime(2017, 9, 3), 25),
        new TimeSeriesSales(new DateTime(2017, 9, 4), 100),
        new TimeSeriesSales(new DateTime(2017, 9, 5), 75),
        new TimeSeriesSales(new DateTime(2017, 9, 6), 88),
        new TimeSeriesSales(new DateTime(2017, 9, 7), 65),
        new TimeSeriesSales(new DateTime(2017, 9, 8), 91),
        new TimeSeriesSales(new DateTime(2017, 9, 9), 100),
        new TimeSeriesSales(new DateTime(2017, 9, 10), 111),
        new TimeSeriesSales(new DateTime(2017, 9, 11), 90),
        new TimeSeriesSales(new DateTime(2017, 9, 12), 50),
        new TimeSeriesSales(new DateTime(2017, 9, 13), 40),
        new TimeSeriesSales(new DateTime(2017, 9, 14), 30),
        new TimeSeriesSales(new DateTime(2017, 9, 15), 40),
        new TimeSeriesSales(new DateTime(2017, 9, 16), 50),
        new TimeSeriesSales(new DateTime(2017, 9, 17), 30),
        new TimeSeriesSales(new DateTime(2017, 9, 18), 35),
        new TimeSeriesSales(new DateTime(2017, 9, 19), 40),
        new TimeSeriesSales(new DateTime(2017, 9, 20), 32),
        new TimeSeriesSales(new DateTime(2017, 9, 21), 31),
      ];

      return [
        new charts.Series<TimeSeriesSales, DateTime>(
          id: '',
          // colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time.toUtc(),
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: data,
        )
      ];
    }

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Provider.of<FitnessData>(context).isDarkModeOn
                        ? Color(0xFF000066)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("EXERCISE",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          height: 250,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircularStat(),
                                        Column(
                                          children: <Widget>[
                                            StatActivities(
                                              staticon: Icons.directions_run,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                            StatActivities(
                                              staticon: Icons.directions_subway,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                            StatActivities(
                                              staticon: Icons.donut_small,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("GOAL COMPLIANCE",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              // child: GoalChart(data: data)),
                              child: BarChartPage()),
                        ),
                        Container(
                          height: 100,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            // child: GoalChart(data: data)),
                            child: TimeSeriesBar(_createSampleData()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatActivities extends StatelessWidget {
  final String act;
  final String subact;
  final IconData staticon;

  StatActivities({this.act, this.subact, this.staticon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            staticon,
            size: 38,
            color: Provider.of<FitnessData>(context).isDarkModeOn
                ? Color(0xFF000066)
                : Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                act,
                style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<FitnessData>(context).isDarkModeOn
                      ? Color(0xFF000066)
                      : Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: subact,
                  style: TextStyle(
                    color: Provider.of<FitnessData>(context).isDarkModeOn
                        ? Color(0xFF000066)
                        : Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: ' km', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
