import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';

import 'package:fitness_provider/Provider/dataconstraint.dart';
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
    var fitness = Provider.of<FitnessData>(context, listen: false);

    List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
      final data = [
        new TimeSeriesSales(new DateTime(2020, 9, 1, 8), 5),
        new TimeSeriesSales(new DateTime(2020, 9, 2, 8), 5),
        new TimeSeriesSales(new DateTime(2020, 9, 3), 25),
        new TimeSeriesSales(new DateTime(2020, 9, 4), 100),
        new TimeSeriesSales(new DateTime(2020, 9, 5), 75),
        new TimeSeriesSales(new DateTime(2020, 9, 6), 88),
        new TimeSeriesSales(new DateTime(2020, 9, 7), 65),
        new TimeSeriesSales(new DateTime(2020, 9, 8), 91),
        new TimeSeriesSales(new DateTime(2020, 9, 9), 100),
        new TimeSeriesSales(new DateTime(2020, 9, 10), 111),
        new TimeSeriesSales(new DateTime(2020, 9, 11), 90),
        new TimeSeriesSales(new DateTime(2020, 9, 12), 50),
        new TimeSeriesSales(new DateTime(2020, 9, 13), 40),
        new TimeSeriesSales(new DateTime(2020, 9, 14), 30),
        new TimeSeriesSales(new DateTime(2020, 9, 15), 40),
        new TimeSeriesSales(new DateTime(2020, 9, 16), 50),
        new TimeSeriesSales(new DateTime(2020, 9, 17), 30),
        new TimeSeriesSales(new DateTime(2020, 9, 18), 35),
        new TimeSeriesSales(new DateTime(2020, 9, 19), 40),
        new TimeSeriesSales(new DateTime(2020, 9, 20), 32),
        new TimeSeriesSales(new DateTime(2020, 9, 21), 31),
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
                          height: 180,
                          child: Card(
                            elevation: 5,
                            color:
                                Provider.of<FitnessData>(context).isDarkModeOn
                                    ? Color(0xFF000099)
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: CircularStat(),
                                  ),
                                  Container(
                                    height: 120,
                                    width: 120,
                                    child: ListView(
                                      children: [
                                        ...fitness.selectedEvents
                                            .map((e) => Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        // activitydetails[i].icon,
                                                        e.icon.icon,
                                                        color: e.color,
                                                        size: 30,
                                                      ),

                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      //  Text(activitydetails[i].date == displayDate?activitydetails[i].activity : ''),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            e.activity
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Provider.of<FitnessData>(
                                                                            context)
                                                                        .isDarkModeOn
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 16),
                                                          ),
                                                          // Text(activity),
                                                          Text(e.subactivity
                                                              .toString()),
                                                          // Text(subactivity),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  // Text(time),
                                                ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("GOAL COMPLIANCE",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        BarChartPage(),
                        SizedBox(
                          height: 10,
                        ),
                        Text("EXERCISE AVG",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color:
                                Provider.of<FitnessData>(context).isDarkModeOn
                                    ? Color(0xFF000099)
                                    : Colors.white,
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          // child: GoalChart(data: data)),
                          child: TimeSeriesBar(_createSampleData()),
                        ),
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

