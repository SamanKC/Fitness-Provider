import 'package:flutter/material.dart';
import 'dataconstraint.dart';

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;

  List<FitnessDetails> _fitnessactivity = [
    FitnessDetails(
      activity: 'Running',
      subactivity: 'run 5 km a day',
      // icon: Icons.ac_unit,
    ),
    FitnessDetails(
      activity: 'Running',
      subactivity: 'run 5 km a day',
      // icon: Icons.ac_unit,
    ),
    FitnessDetails(
      activity: 'Running',
      subactivity: 'run 5 km a day',
      // icon: Icons.ac_unit,
    ),
  ];

  List<FitnessDetails> get fitnessactivity => _fitnessactivity;

  set fitnessactivity(List<FitnessDetails> val) {
    _fitnessactivity = val;
    notifyListeners();
  }

  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  List<MenuDetails> _allmenu = [
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      // icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
  ];
  List<MenuDetails> get menu => _allmenu;

  set menu(List<MenuDetails> val) {
    _allmenu = val;
    notifyListeners();
  }

  List<ActivityIcons> iconactivity = [
    ActivityIcons(
      icon: Icons.local_activity,
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icons.local_cafe,
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icons.local_dining,
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icons.local_grocery_store,
      icontitle: 'eat healthy',
    ),
    ActivityIcons(
      icon: Icons.local_library,
      icontitle: 'eat healthy',
    ),
  ];
  List<ActivityIcons> get icons => iconactivity;

  set icons(List<ActivityIcons> val) {
    iconactivity = val;
    notifyListeners();
  }


  

  void addactivity({text, text1}) {
    fitnessactivity.add(FitnessDetails(activity: text, subactivity: text1));
    notifyListeners();
  }

  void addmenu({text, text1}) {
    _allmenu.add(MenuDetails(menu: text, submenu: text1));
    notifyListeners();
  }
}
