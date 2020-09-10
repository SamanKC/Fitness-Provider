import 'package:fitness_provider/CustomFolder/customcard.dart';

import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TopBar(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Week",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Month",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Year",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    ],
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
                  child: Column(
                    children: <Widget>[
                      Padding(
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
                            Container(
                              height: MediaQuery.of(context).size.height - 200,
                              child: CustomCard(),
                            ),
                          ],
                        ),
                      ),
                    ],
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
