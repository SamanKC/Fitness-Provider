import 'package:flutter/material.dart';

class FitnessDetails {
  final String activity;
  final String subactivity;
  final IconData icon;
  final String time;
  final String date;
  FitnessDetails(
      {this.activity, this.subactivity, this.icon, this.time, this.date});
}

class MenuDetails {
  final String menu;
  final String submenu;
  final IconData icon;
  final String time;
  final String date;
  MenuDetails({this.menu, this.submenu, this.icon, this.time, this.date});
}

class ActivityIcons {
  final Icon icon;
  final String icontitle;
  ActivityIcons({this.icon, this.icontitle});
}

class MenuIcons {
  final Icon icon;
  final String icontitle;
  MenuIcons({this.icon, this.icontitle});
}
