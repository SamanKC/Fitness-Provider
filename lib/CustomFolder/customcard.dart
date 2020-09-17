import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Widgets/linearbar.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  // final String running;
  // final String totalrunning;

  // CustomCard({this.running, this.totalrunning});

  @override
  Widget build(BuildContext context) {
    var activitydetails = Provider.of<FitnessData>(context).selectedEvents;
    DateTime now = DateTime.now();

    // DateTime localDateTime = dateTime.toLocal();

    // String roughTimeString = DateFormat('jm').format(dateTime);
    // if (localDateTime.day == now.day &&
    //     localDateTime.month == now.month &&
    //     localDateTime.year == now.year) {
    //   return roughTimeString;
    // }
    return ListView.builder(
        itemCount: activitydetails.length,
        itemBuilder: (BuildContext context, i) {
          return Container(
            height: 205,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          activitydetails[i].icon.icon,
                          size: 34,
                          color: Provider.of<FitnessData>(context).isDarkModeOn
                              ? Color(0xFF000066)
                              : Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              activitydetails[i].activity,
                              style: TextStyle(
                                color: Provider.of<FitnessData>(context)
                                        .isDarkModeOn
                                    ? Color(0xFF000066)
                                    : Colors.white,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '2500',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Provider.of<FitnessData>(context)
                                          .isDarkModeOn
                                      ? Color(0xFF000066)
                                      : Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'm',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    HorizontalProgress(
                      percentage: 0.5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '4000',
                        style: TextStyle(
                          fontSize: 26,
                          color: Provider.of<FitnessData>(context).isDarkModeOn
                              ? Color(0xFF000066)
                              : Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'm',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20)),
                        ],
                      ),
                    ),
                    Text("needed to reach your goal",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
