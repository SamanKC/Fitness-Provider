import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dataconstraint.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;
  CalendarController _controller = CalendarController();
  CalendarController get controller => _controller;
  set controller(CalendarController val) {
    _controller = val;
    notifyListeners();
  }

  Map<DateTime, List<FitnessDetails>> _events = {};
  Map<DateTime, List<MenuDetails>> _eventsmenu = {};

  List<FitnessDetails> _selectedEvents = [];
  List<MenuDetails> _selectedEventsmenu = [];
  List<FitnessDetails> get selectedEvents => _selectedEvents;
  List<MenuDetails> get selectedEventsmenu => _selectedEventsmenu;
  Map<DateTime, List<FitnessDetails>> get events => _events;
  Map<DateTime, List<MenuDetails>> get eventsmenu => _eventsmenu;
  set events(Map<DateTime, List<FitnessDetails>> val) {
    _events = val;
    notifyListeners();
  }

  set eventsmenu(Map<DateTime, List<MenuDetails>> val) {
    _eventsmenu = val;
    notifyListeners();
  }

  showingTheEvent({activity, subactivity, icon, color, time, controller}) {
    events[controller] = [
      FitnessDetails(
        activity: activity,
        subactivity: subactivity,
        icon: icon,
        color: color,
        time: time,
      ),
    ];
    notifyListeners();
  }

  showingTheEventmenu({menu, submenu, icon, color, time, controller}) {
    eventsmenu[controller] = [
      MenuDetails(
        menu: menu,
        submenu: submenu,
        icon: icon,
        color: color,
        time: time,
      ),
    ];
    notifyListeners();
  }

  set selectedEvents(List<FitnessDetails> val) {
    _selectedEvents = val;
    notifyListeners();
  }

  set selectedEventsmenu(List<MenuDetails> val) {
    _selectedEventsmenu = val;
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

  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }


  List<ActivityIcons> _iconactivity = [
    ActivityIcons(
      // icon: Icon(Icons.directions_run),
      icon: FaIcon(FontAwesomeIcons.running),

      icontitle: 'Running',
      color: Color(0xFFDAA520),
    ),
    ActivityIcons(
      icon: FaIcon(FontAwesomeIcons.bicycle),
      icontitle: 'Cycling',
      // color: Colors.blue,
      color: Color(0xFF1E90FF),
    ),
    ActivityIcons(
      icon: FaIcon(FontAwesomeIcons.walking),
      icontitle: 'Walking',
      // color: Colors.green,
      color: Color(0xFF1E90FF),
    ),
    ActivityIcons(
      icon: FaIcon(FontAwesomeIcons.bed),
      icontitle: 'Sleeping',
      // color: Colors.red,
      color: Color(0xFF00CED1),
    ),
    ActivityIcons(
      icon: FaIcon(FontAwesomeIcons.book),
      icontitle: 'Reading',
      // color: Colors.yellow,
      color: Color(0xFF00FF00),
    ),
  ];

  List<ActivityIcons> get icons => _iconactivity;

  set icons(List<ActivityIcons> val) {
    _iconactivity = val;
    notifyListeners();
  }

  List<MenuIcons> _iconmenu = [
    MenuIcons(
      icon: FaIcon(FontAwesomeIcons.coffee),
      icontitle: 'BreakFast',
      color: Color(0xFFDAA520),
    ),
    MenuIcons(
      icon: FaIcon(FontAwesomeIcons.chartPie),
      icontitle: 'Lunch',
      color: Color(0xFF00FF00),
    ),
    MenuIcons(
      icon: FaIcon(FontAwesomeIcons.birthdayCake),
      icontitle: 'Dinner',
      color: Color(0xFF1E90FF),
    ),
    MenuIcons(
      icon: FaIcon(FontAwesomeIcons.cocktail),
      icontitle: 'Brunch',
      color: Color(0xFF00FF00),
    ),
    MenuIcons(
      icon: FaIcon(FontAwesomeIcons.coffee),
      icontitle: 'Snack',
      color: Color(0xFF1E90FF),
    ),
  ];

  List<MenuIcons> get iconsmenu => _iconmenu;

  set iconsmenu(List<MenuIcons> val) {
    _iconmenu = val;
    notifyListeners();
  }

  whenSelectedDay({day, events}) {
    selectedEvents = events.cast<FitnessDetails>();

    notifyListeners();
  }

  whenSelectedDaymenu({day}) {
    selectedEventsmenu = (_eventsmenu[day] ?? []).cast<MenuDetails>();

    notifyListeners();
  }

  addactivity({text, text1, selectedicon, picktime, color, controller}) {
    events[controller].add(
      FitnessDetails(
        activity: text,
        subactivity: text1,
        icon: selectedicon,
        color: color,
        time: picktime,
      ),
    );
    notifyListeners();
  }

  addmenu({text, text1, selectedicon, picktime, color, controller}) {
    eventsmenu[controller].add(
      MenuDetails(
        menu: text,
        submenu: text1,
        icon: selectedicon,
        color: color,
        time: picktime,
      ),
    );
    notifyListeners();
  }
  
  void sortdate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.weekday);
    final tomorrow = DateTime(now.year, now.month);
    print(yesterday);
    print(tomorrow);

    final aDate = DateTime(yesterday.year, yesterday.month, yesterday.day);
    for (var i = 0; i < selectedEvents.length; i++) {
      if (aDate == today) {
        print(aDate);
        print("Today");
      } else if (aDate == yesterday) {
        print("Yesterday");
      } else if (aDate == tomorrow) {
        print("tomorrow");
      }
    }
  }
}
