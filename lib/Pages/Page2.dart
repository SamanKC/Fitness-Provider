import 'package:fitness_provider/CustomFolder/customlistactivities.dart';
import 'package:fitness_provider/CustomFolder/custommenuactivities.dart';
import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Provider/dataconstraint.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  CalendarController _controller;

  FitnessData fitness;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    // _events = {};
    // _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
    var _calendaractivity = Provider.of<FitnessData>(context, listen: false);
    print(_calendaractivity.events);
    // var activitydetails = Provider.of<FitnessData>(context).selectedEvents;

    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    TopBar(),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     FlatButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Today",
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //           ),
                    //         )),
                    //     FlatButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Week",
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //           ),
                    //         )),
                    //     FlatButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Month",
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //           ),
                    //         )),
                    //     FlatButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Year",
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //           ),
                    //         )),
                    //   ],
                    // )
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TableCalendar(
                              // onDaySelected: (date, events) {
                              //   setState(() {
                              //     _selectedEvents = events;
                              //   });
                              // },
                              events: fitness.events,
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
                    )
                  ],
                ),
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
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("ACTIVITIES",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                              FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "see all",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // CustomActivities(),
                          ...fitness.selectedEvents.map(
                            (FitnessDetails) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            // padding: EdgeInsets.all(18.0),
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            // child: Icon(
                                            //   // activitydetails[i].icon,

                                            //   size: 30,
                                            // ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        //  Text(activitydetails[i].date == displayDate?activitydetails[i].activity : ''),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(FitnessDetails.activity
                                                .toString()),
                                            // Text(activity),
                                            Text(FitnessDetails.subactivity
                                                .toString()),
                                            // Text(subactivity),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(FitnessDetails.time.toString()),
                                  // Text(time),
                                ],
                              );
                            },
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Menu",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                              FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "see all",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomMenu()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:fitness_provider/CustomFolder/customlistactivities.dart';
// import 'package:fitness_provider/CustomFolder/custommenuactivities.dart';
// import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
// import 'package:fitness_provider/Provider/alldata.dart';
// import 'package:fitness_provider/Provider/dataconstraint.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Page2 extends StatefulWidget {
//   @override
//   _Page2State createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   CalendarController _controller;

//   // Map<DateTime, List<FitnessDetails>> _events;
//   // List _selectedEvents;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//     // final _selectedDay = DateTime.now();
//     // _selectedEvents = _events[_selectedDay] ?? [];
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // void _onDaySelected(DateTime day, List events) {
//   //   print('CALLBACK: _onDaySelected');
//   //   setState(() {
//   //     _selectedEvents = events;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var fitness = Provider.of<FitnessData>(context, listen: false);
//     return Consumer<FitnessData>(
//           builder: (BuildContext context, value, Widget child) =>
//          Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TopBar(),
//               SizedBox(
//                 height: 10,
//               ),
//               TableCalendar(
//                   events: fitness.events,
//                   // onDaySelected: (day, events) {
//                   //   fitness.whenSelectedDay(event: events);
//                   // },
//                   // onDaySelected: _onDaySelected,
//                   onDaySelected: (day, events) {
//                     fitness.whenSelectedDay(event: events);
//                   },
//                   initialCalendarFormat: CalendarFormat.week,
//                   calendarStyle: CalendarStyle(
//                     todayColor: Colors.blue,
//                     selectedColor: Colors.orange,
//                     todayStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   headerVisible: false,
//                   calendarController: _controller),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Provider.of<FitnessData>(context).isDarkModeOn
//                           ? Color(0xFF000066)
//                           : Colors.grey[100],
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30))),
//                   child: SingleChildScrollView(
//                     child: Container(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         children: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text("ACTIVITIES",
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                               FlatButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     "see all",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           // ...fitness.fitnessactivity.map((FitnessDetails) {
//                           //   return CustomActivities(
//                           //     activity: FitnessDetails.activity,
//                           //     subactivity: FitnessDetails.subactivity,
//                           //     icon: FitnessDetails.icon,
//                           //     time: FitnessDetails.time,
//                           //   );
//                           // }),

//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text("Menu",
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                               FlatButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     "see all",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           CustomMenu()
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:fitness_provider/Provider/alldata.dart';
// import 'package:fitness_provider/Provider/dataconstraint.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// import 'package:table_calendar/table_calendar.dart';

// class Page2 extends StatefulWidget {
//   @override
//   _Page2State createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   // Map<DateTime, List> _events;
//   // Map<DateTime, List<dynamic>> _events;
//   List<FitnessDetails> _selectedEvents;

//   CalendarController _calendarController;
//   FitnessData fitness;

//   @override
//   void initState() {
//     super.initState();
//     final _selectedDay = DateTime.now();

//     // _events = {};
//     // _selectedEvents = _events[_selectedDay] ?? [];

//     _calendarController = CalendarController();
//   }

//   @override
//   void dispose() {
//     _calendarController.dispose();
//     super.dispose();
//   }

//   void _onDaySelected(DateTime day, List events) {
//     print('CALLBACK: _onDaySelected');
//     print(day);

//     final displayDate = DateFormat.yMMMd().format(day);

//     setState(() {
//       _selectedEvents = events;
//     });
//     print(displayDate);
//     print(events);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var fitnessdetails = Provider.of<FitnessData>(context).fitnessactivity;

//     return Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           // Switch out 2 lines below to play with TableCalendar's settings
//           //-----------------------
//           _buildTableCalendar(),
//           // _buildTableCalendarWithBuilders(),
//           const SizedBox(height: 8.0),

//           const SizedBox(height: 8.0),
//           Expanded(child: _buildEventList()),
//         ],
//       ),
//     );
//   }

//   // Simple TableCalendar configuration (using Styles)
//   Widget _buildTableCalendar() {
//     return TableCalendar(
//       calendarController: _calendarController,
//       // events: fitness.events,
//       // holidays: _holidays,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       initialCalendarFormat: CalendarFormat.week,
//       calendarStyle: CalendarStyle(
//         selectedColor: Colors.deepOrange[400],
//         todayColor: Colors.deepOrange[200],
//         markersColor: Colors.brown[700],
//         outsideDaysVisible: false,
//       ),
//       headerStyle: HeaderStyle(
//         formatButtonTextStyle:
//             TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
//         formatButtonDecoration: BoxDecoration(
//           color: Colors.deepOrange[400],
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//       ),
//       onDaySelected: _onDaySelected,
//     );
//   }

//   Widget _buildEventList() {
//     return ListView(
//       children: _selectedEvents
//           .map((event) => Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.8),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: ListTile(
//                   title: Text(event.toString()),
//                   onTap: () => print('$event tapped!'),
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }
