import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dataconstraint.dart';

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;

  List<FitnessDetails> fitnessactivity = [
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

  List<FitnessDetails> get data => fitnessactivity;

  set data(List<FitnessDetails> val) {
    fitnessactivity = val;
    notifyListeners();
  }

  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  List<MenuDetails> allmenu = [
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
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
  ];
  List<MenuDetails> get menu => allmenu;

  set menu(List<MenuDetails> val) {
    allmenu = val;
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

  void addactivity(newmenu, newsubmenu) {
    final act = FitnessDetails(activity: newmenu, subactivity: newsubmenu);
    // final subact = FitnessDetails(subactivity: newsubmenu);
    fitnessactivity.add(act);
    print(act.activity);
    
    // _fitnessactivity.add(subact);
  }
}
