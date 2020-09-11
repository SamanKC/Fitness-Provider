import 'package:flutter/material.dart';
import 'dataconstraint.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;
  Map<DateTime, List<dynamic>> _events;

  FitnessDetails fitness;
  List<FitnessDetails> _fitnessactivity = [
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 10,2020"),
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 10,2020"),
    FitnessDetails(
        activity: 'Running',
        subactivity: 'run 5 km a day',
        icon: Icons.ac_unit,
        time: "11:37 PM",
        date: "Sep 20,2020"),
  ];
  List<FitnessDetails> _selectedEvents = [];
  int _selectedDaysItem = 1;
  int get selectedDaysItem => _selectedDaysItem;
  set selectedDaysItem(int val) {
    _selectedDaysItem = val;
    notifyListeners();
  }

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

  List<FitnessDetails> get fitnessactivity => _fitnessactivity;

  set fitnessactivity(List<FitnessDetails> val) {
    _fitnessactivity = val;
    notifyListeners();
  }

  int _todaysEventnumber = 0;

  Map<DateTime, List<FitnessDetails>> get events => _events;
  List<FitnessDetails> get selectedEvents => _selectedEvents;
  int get todaysEventnumber => _todaysEventnumber;
  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  void eve() {
    this._events = events;
    notifyListeners();
  }

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

  void addactivity({text, text1, selectedicon, picktime, pickdate}) {
    fitnessactivity.add(FitnessDetails(
        activity: text,
        subactivity: text1,
        icon: selectedicon.icon,
        time: picktime,
        date: pickdate));
    notifyListeners();
  }

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
