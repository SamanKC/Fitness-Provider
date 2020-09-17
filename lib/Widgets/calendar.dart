import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Provider/dataconstraint.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Page2Calendar extends StatefulWidget {
  @override
  _Page2CalendarState createState() => _Page2CalendarState();
}

class _Page2CalendarState extends State<Page2Calendar> {
  CalendarController _controller;
  FitnessData fitnessData;
  FitnessDetails fitnessDetails;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    // var _calendaractivity = Provider.of<FitnessData>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
              // events: _calendaractivity.events,
              // onDaySelected: (day, events) {
              //   var theControllerMethod = _controller.selectedDay;
              //   if (fitnessData.events[_controller.selectedDay] != null) {
              //     fitnessData.fitnessactivity;
              //   } else {
              //     // fitnessData.showEvents(
              //     //     {fitnessact: _calendaractivity.fitness, controller: theControllerMethod});
              //     fitnessData.showEvents({
              //       fitnessact: _calendaractivity.fitness,
              //       controller: theControllerMethod,
              //     });
              //   }
              // },
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Colors.orange,
                todayStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              headerVisible: false,
              calendarController: _controller),
        ],
      ),
    );
  }
}
