import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Navigation/TopNavigationBar.dart';
import '../Provider/alldata.dart';
import '../Provider/alldata.dart';
import '../Provider/dataconstraint.dart';
import '../Provider/dataconstraint.dart';
import '../Provider/dataconstraint.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var fitness = Provider.of<FitnessData>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          TopBar(),
          SizedBox(
            height: 5,
          ),
          TableCalendar(
            calendarController: fitness.controller,
            events: fitness.events,

            onDaySelected: (day, events) {
              fitness.whenSelectedDay(events: events);
              fitness.whenSelectedDaymenu(day: day);
            },

            // onDaySelected: _onDaySelected,
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
          ),
          // Expanded(
          //     child: Container(
          //   decoration: BoxDecoration(
          //       color: Provider.of<FitnessData>(context).isDarkModeOn
          //           ? Color(0xFF000066)
          //           : Colors.grey[100],
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(30),
          //           topRight: Radius.circular(30))),
          //   padding: EdgeInsets.all(16.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Color(0xFF000066)
                    : Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ACTIVITY",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "show all",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                  ],
                ),

                Container(
                  height: 130,
                  child: ListView(
                    children: [
                      ...fitness.selectedEvents.map((e) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    // padding: EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                        color: e.color,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Icon(
                                      // activitydetails[i].icon,
                                      e.icon.icon,
                                      color: Colors.white,
                                      size: 30,
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
                                      Text(
                                        e.activity.toString(),
                                        style: TextStyle(
                                            color: Provider.of<FitnessData>(
                                                        context)
                                                    .isDarkModeOn
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20),
                                      ),
                                      // Text(activity),
                                      Text(e.subactivity.toString()),
                                      // Text(subactivity),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(e.time.toString()),
                                ],
                              ),
                            ),

                            // Text(time),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Meal",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "show all",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                  ],
                ),
                // Container(
                //   height: 150,
                //   child: ListView(
                //       children: fitness.selectedEventsmenu
                //           .map(
                //             (e) => Container(
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Row(
                //                   children: [
                //                     Container(
                //                       height: 60,
                //                       width: 60,
                //                       // padding: EdgeInsets.all(18.0),
                //                       decoration: BoxDecoration(
                //                           color: Colors.orange,
                //                           borderRadius:
                //                               BorderRadius.circular(10.0)),
                //                       child: Icon(
                //                         // activitydetails[i].icon,
                //                         e.icon.icon,
                //                         size: 30,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       width: 10,
                //                     ),
                //                     //  Text(activitydetails[i].date == displayDate?activitydetails[i].activity : ''),
                //                     Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: <Widget>[
                //                         Text(e.menu.toString()),
                //                         // Text(activity),
                //                         Text(e.submenu.toString()),
                //                         // Text(subactivity),
                //                       ],
                //                     ),
                //                     Spacer(),
                //                     Text(e.time.toString()),
                //                   ],
                //                 ),
                //               ),

                //               // Text(time),
                //             ),
                //           )
                //           .toList()),
                // )
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      ...fitness.selectedEventsmenu.map((a) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    // padding: EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                        color: a.color,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Icon(
                                      // activitydetails[i].icon,
                                      a.icon.icon,
                                      color: Colors.white,
                                      size: 30,
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
                                      Text(
                                        a.menu.toString(),
                                        style: TextStyle(
                                            color: Provider.of<FitnessData>(
                                                        context)
                                                    .isDarkModeOn
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20),
                                      ),
                                      // Text(activity),
                                      Text(a.submenu.toString()),
                                      // Text(subactivity),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(a.time.toString()),
                                ],
                              ),
                            ),

                            // Text(time),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
