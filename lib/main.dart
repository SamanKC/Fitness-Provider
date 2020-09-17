import 'package:fitness_provider/Pages/Page1.dart';
import 'package:fitness_provider/Pages/Page2.dart';
import 'package:fitness_provider/Pages/Page3.dart';
import 'package:fitness_provider/Pages/Page4.dart';
import 'package:fitness_provider/Widgets/add_activity_bottom.dart';
import 'package:fitness_provider/Widgets/add_menu_bottom.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'Provider/alldata.dart';

void main() => runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<FitnessData>(
                builder: (BuildContext context) => FitnessData())
          ],
          child: Consumer<FitnessData>(
            builder: (context, value, child) => MyApp(),
          )),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(color: Color(0xFF000099)),
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.blue,
      ),
    ),
  );
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xFF000099),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<FitnessData>(context).isDarkModeOn
          ? darkTheme
          : lightTheme,
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _cIndex = 0;

  final tabs = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_cIndex],
        floatingActionButton: SpeedDial(
          marginRight: MediaQuery.of(context).size.width / 2 - 15,
          marginBottom: 60.0,
          child: Icon(Icons.add),
          closeManually: false,
          curve: Curves.bounceIn,
          overlayOpacity: 0,
          foregroundColor: Colors.white,
          backgroundColor: Provider.of<FitnessData>(context).isDarkModeOn
              ? Color(0xFFFFCCCC)
              : Color(0xFF0000CC),
          elevation: 8.0,
          children: [
            SpeedDialChild(
                child: Icon(Icons.fastfood),
                backgroundColor: Colors.blue,
                label: 'Add Menu',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Provider.of<FitnessData>(context).isDarkModeOn
                      ? Color(0xFF000099)
                      : Colors.black,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: AddMenuScreen(),
                            ),
                          ));
                }),
            SpeedDialChild(
              child: Icon(Icons.accessibility_new),
              backgroundColor: Colors.red,
              label: 'Add Activity',
              labelStyle: TextStyle(
                fontSize: 18.0,
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Color(0xFF000099)
                    : Colors.black,
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddActivityScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: Provider.of<FitnessData>(context).isDarkModeOn
                ? Color(0xFF000099)
                : Colors.white,
            currentIndex: _cIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 35.0,
            selectedItemColor: Provider.of<FitnessData>(context).isDarkModeOn
                ? Colors.white
                : Color(0xFF0000CC),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm_add),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: new Text(''),
              ),
            ],
            onTap: (index) {
              setState(() {
                _cIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
