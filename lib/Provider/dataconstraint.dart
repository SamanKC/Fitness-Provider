import 'package:flutter/material.dart';

class FitnessDetails {
  final String activity;
  final String subactivity;
  // final IconData icon;
  FitnessDetails({this.activity, this.subactivity});
}

class MenuDetails {
  final String menu;
  final String submenu;
  final IconData icon;
  MenuDetails({this.menu, this.submenu, this.icon});
}

class ActivityIcons {
  final IconData icon;
  final String icontitle;
  ActivityIcons({this.icon, this.icontitle});
}
