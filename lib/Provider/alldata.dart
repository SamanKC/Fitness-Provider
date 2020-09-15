import 'package:fitness_provider/CustomFolder/customlistactivities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dataconstraint.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;
  // Map<DateTime, List<FitnessDetails>> _events = {
  //   DateTime.now(): [
  //     FitnessDetails(
  //         activity: "hello",
  //         subactivity: "sdfh",
  //         icon: Icons.ac_unit,
  //         date: "sdf",
  //         time: "sfsdff")
  //   ]
  // };

  Map<DateTime, List<FitnessDetails>> _events = {};
  // _events[DateTime.now()] = ['abc'];
  // List<FitnessDetails> _selectedEvents = [FitnessDetails(
  //         activity: "hello",
  //         subactivity: "sdfh",
  //         icon: Icons.ac_unit,
  //         date: "sdf",
  //         time: "sfsdff")];
  List<FitnessDetails> _selectedEvents = [];
  List<FitnessDetails> get selectedEvents => _selectedEvents;
  Map<DateTime, List<FitnessDetails>> get events => _events;
  set events(Map<DateTime, List<FitnessDetails>> val) {
    _events = val;
    notifyListeners();
  }

  showingTheEvent({activity, subactivity, icon, time, controller}) {
    events[controller] = [
      FitnessDetails(
        activity: activity,
        subactivity: subactivity,
        icon: icon,
        time: time,
      ),
    ];
    notifyListeners();
  }

  set selectedEvents(List<FitnessDetails> val) {
    _selectedEvents = val;
    notifyListeners();
  }

  List<FitnessDetails> _fitnessactivity = [
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 1, 2020"),
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 1, 2020"),
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 14, 2020"),
  ];

  List<FitnessDetails> get fitnessactivity => _fitnessactivity;

  set fitnessactivity(List<FitnessDetails> val) {
    _fitnessactivity = val;
    notifyListeners();
  }

  // /// Compare dates, return a bool value. [True] is same date or [false] else
  // bool compare = false;
  // compareDate(dateA, date) {
  //   print(dateA);
  //   date = fitnessactivity.;
  //   if (dateA == date
  //       // dateA?.day == date?.day &&
  //       // dateA?.year == date?.year
  //       ) {
  //     compare = true;
  //     notifyListeners();
  //   }
  //   compare = false;
  //   notifyListeners();
  // }

  settingTheValue({controller}) {
    fitnessactivity = events[controller];
    notifyListeners();
  }

  // showTodaysEventlist() {
  //   List<Widget> listViewContainer = [];
  //   String calendarFormattedDate;
  //   DateTime now = DateTime.now();
  //   // final displayDate = DateFormat.yMMMd().format(now);
  //   String formattedDate =
  //       DateFormat('yyyy-MM-dd').format(now); //this is todays date
  //   List theConvertedKeysList = events.keys.toList(); //keys list
  //   for (int i = 0; i < theConvertedKeysList.length; i++) {
  //     calendarFormattedDate =
  //         DateFormat('yyyy-MM-dd').format(theConvertedKeysList[i]);
  //     if (calendarFormattedDate == formattedDate) {
  //       for (int j = 0; j < events[theConvertedKeysList[i]].length; j++) {
  //         listViewContainer.add(Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: CustomActivities(
  //             activity: events[theConvertedKeysList[i]][j].activity,
  //             subactivity: events[theConvertedKeysList[i]][j].subactivity,
  //             icon: events[theConvertedKeysList[i]][j].icon,
  //             time: events[theConvertedKeysList[i]][j].time,
  //           ),
  //         ));
  //       }
  //     } else {
  //       Container(
  //         child: Text("There is no any events"),
  //       );
  //     }
  //   }
  //   return listViewContainer;
  // }

  List<FitnessData> list = [];
  var timeSeries;
  Future buildGraphData() async {
    this.timeSeries = [
      charts.Series<FitnessData, DateTime>(
          id: 'timeSeriesChart',
          domainFn: (FitnessData data, _) => data.timeSeries,
          measureFn: (FitnessData data, _) => data.timeSeries,
          data: list)
    ];
  }

  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  // void eve() {
  //   this._events = events;
  //   notifyListeners();
  // }

  List<MenuDetails> _allmenu = [
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
      time: "11:37 PM",
      date: "Sep 10,2020",
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
      time: "11:37 PM",
      date: "Sep 10,2020",
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
      time: "11:37 PM",
      date: "Sep 10,2020",
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
      time: "11:37 PM",
      date: "Sep 10,2020",
    ),
  ];
  List<MenuDetails> get fitnessmenu => _allmenu;

  set menu(List<MenuDetails> val) {
    _allmenu = val;
    notifyListeners();
  }

  List<ActivityIcons> _iconactivity = [
    ActivityIcons(
      icon: Icon(Icons.router),
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icon(Icons.rounded_corner),
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icon(Icons.directions_bike),
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icon(Icons.local_grocery_store),
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icon(Icons.local_library),
      icontitle: 'eat healthy',
    ),
  ];

  List<ActivityIcons> get icons => _iconactivity;

  set icons(List<ActivityIcons> val) {
    _iconactivity = val;
    notifyListeners();
  }

  List<MenuIcons> _iconmenu = [
    MenuIcons(
      icon: Icon(Icons.access_alarm),
      icontitle: 'eat healthy',
    ),
    MenuIcons(
      icon: Icon(Icons.fastfood),
      icontitle: 'eat healthy',
    ),
    MenuIcons(
      icon: Icon(Icons.local_dining),
      icontitle: 'eat healthy',
    ),
    MenuIcons(
      icon: Icon(Icons.local_grocery_store),
      icontitle: 'eat healthy',
    ),
    MenuIcons(
      icon: Icon(Icons.local_library),
      icontitle: 'eat healthy',
    ),
  ];

  List<MenuIcons> get iconsmenu => _iconmenu;

  set iconsmenu(List<MenuIcons> val) {
    _iconmenu = val;
    notifyListeners();
  }

  whenSelectedDay({event}) {
    selectedEvents = event.cast<FitnessDetails>();
    notifyListeners();
  }

  addactivity({text, text1, selectedicon, picktime, pickdate, controller}) {
    events[controller].add(
      FitnessDetails(
        activity: text,
        subactivity: text1,
        icon: selectedicon,
        time: picktime,
        date: pickdate,
      ),
    );

    notifyListeners();
  }
  // void addactivity({text, text1, selectedicon, picktime, pickdate, controller}) {
  //   fitnessactivity.add(FitnessDetails(
  //       activity: text,
  //       subactivity: text1,
  //       icon: selectedicon.icon,
  //       time: picktime,
  //       date: pickdate,));

  //   notifyListeners();
  // }

  void addmenu({texts, texts1, selectedicon, picktime, pickdate}) {
    fitnessmenu.add(MenuDetails(
      menu: texts,
      submenu: texts1,
      icon: selectedicon.icon,
      time: picktime,
      date: pickdate,
    ));
    notifyListeners();
  }

  // showEvents({fitnessact, controller}) {
  //   events[controller] = [FitnessDetails(activity: fitnessact.toString(), subactivity: controller)];
  // }
}
