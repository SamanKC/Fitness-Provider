import 'package:fitness_provider/CustomFolder/customcard.dart';

import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Navigation/TopNavigationBar.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  FitnessData fitness;
  @override
  Widget build(BuildContext context) {
    fitness = Provider.of<FitnessData>(context, listen: false);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Provider.of<FitnessData>(context).isDarkModeOn
              ? Color(0xFF000099)
              : Colors.white,
          elevation: 0,
          title: TopBar(),
          bottom: TabBar(tabs: [
            Tab(
                child: Text(
              "Today",
              style: TextStyle(
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Colors.white
                    : Color(0xFF000099),
              ),
            )),
            Tab(
                child: Text(
              "Week",
              style: TextStyle(
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Colors.white
                    : Color(0xFF000099),
              ),
            )),
            Tab(
                child: Text(
              "Month",
              style: TextStyle(
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Colors.white
                    : Color(0xFF000099),
              ),
            )),
            Tab(
                child: Text(
              "Year",
              style: TextStyle(
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Colors.white
                    : Color(0xFF000099),
              ),
            )),
          ]),
        ),
        body: TabBarView(children: [
          buildTab(context),
          buildTab(context),
          buildTab(context),
          buildTab(context),
        ]),
      ),
    );
  }
}

Widget buildTab(context) {
  return Container(
    decoration: BoxDecoration(
        color: Provider.of<FitnessData>(context).isDarkModeOn
            ? Color(0xFF000066)
            : Colors.grey[100],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
                    Text("ACTIVITY",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "show all",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 278,
                  child: CustomCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
