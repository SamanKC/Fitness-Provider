import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesBar extends StatelessWidget {
  final List<charts.Series> seriesList;

  TimeSeriesBar(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
      defaultInteractions: false,
      domainAxis: new charts.DateTimeAxisSpec(
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'h da',
            transitionFormat: 'h dda',
          ),
        ),
      ),
      primaryMeasureAxis:
          charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter()],
    );
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
