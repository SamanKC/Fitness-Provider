import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Widgets/linearbar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  // final String running;
  // final String totalrunning;

  // CustomCard({this.running, this.totalrunning});

  @override
  Widget build(BuildContext context) {
    var activitydetails = Provider.of<FitnessData>(context).data;

    return ListView.builder(
        itemCount: activitydetails.length,
        itemBuilder: (BuildContext context, i) {
          return Container(
            height: 250,
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
                          // activitydetails[i].icon,
                          Icons.local_library,
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
