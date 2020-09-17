import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FitnessDetails {
  final String activity;
  final String subactivity;
  final FaIcon icon;
  final Color color;
  final String time;
  final String date;
  FitnessDetails(
      {this.activity,
      this.subactivity,
      this.icon,
      this.color,
      this.time,
      this.date});
}

class MenuDetails {
  final String menu;
  final String submenu;
  final FaIcon icon;
  final Color color;
  final String time;
  final String date;
  MenuDetails(
      {this.menu, this.submenu, this.icon, this.color, this.time, this.date});
}

class ActivityIcons {
  final FaIcon icon;
  final String icontitle;
  final Color color;
  ActivityIcons({this.icon, this.icontitle, this.color});
}

class MenuIcons {
  final FaIcon icon;
  final String icontitle;
  final Color color;
  MenuIcons({this.icon, this.icontitle, this.color});
}
