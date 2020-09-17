// import 'package:fitness_provider/Provider/alldata.dart';
// import 'package:fitness_provider/Provider/dataconstraint.dart';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:provider/provider.dart';

// class AddMenuScreen extends StatefulWidget {
//   @override
//   _AddMenuScreenState createState() => _AddMenuScreenState();
// }

// class _AddMenuScreenState extends State<AddMenuScreen> {
//   final _menucontroller = TextEditingController();
//   final _submenucontroller = TextEditingController();
//   DateTime currentdate = DateTime.now();
//   TimeOfDay _currenttime = TimeOfDay.now();
//   Future<Null> _selectdate(BuildContext context) async {
//     final DateTime _seldate = await showDatePicker(
//       context: context,
//       initialDate: currentdate,
//       firstDate: currentdate,
//       lastDate: currentdate.add(Duration(
//         days: 365,
//       )),
//     );
//     if (_seldate != null) {
//       setState(() {
//         currentdate = _seldate;
//       });
//     }
//   }

//   Future<Null> _selectTime(BuildContext context) async {
//     final TimeOfDay _seltime =
//         await showTimePicker(context: context, initialTime: _currenttime);
//     if (_seltime != null) {
//       setState(() {
//         _currenttime = _seltime;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     final formattedTimeOfDay = localizations.formatTimeOfDay(_currenttime);
//     var menuadd = Provider.of<FitnessData>(context, listen: false);
//     final displayDate = DateFormat.yMMMd().format(currentdate);
//     var iconsdetails = Provider.of<FitnessData>(context).icons;
//     ActivityIcons selecteduser;
//     return Container(
//       color: Color(0xff757575),
//       height: 410,
//       child: Container(
//         padding: EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               'Add Menu',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _menucontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter menu",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "Menu cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _submenucontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter submenu",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "Submenu cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 60,
//               // width: MediaQuery.of(context).size.width - 40,
//               child: DropdownButton<ActivityIcons>(
//                 hint: Text("Select icon"),
//                 value: selecteduser,
//                 onChanged: (ActivityIcons newvalue) {
//                   setState(() {
//                     selecteduser = newvalue;
//                   });
//                 },
//                 // items: iconsdetails.map((ActivityIcons nexticon) {
//                 //   return DropdownMenuItem<ActivityIcons>(
//                 //     value: nexticon,
//                 //     child: Row(
//                 //       children: <Widget>[
//                 //         nexticon.icon,
//                 //         SizedBox(
//                 //           width: 10,
//                 //         ),
//                 //         Text(
//                 //           nexticon.icontitle,
//                 //           style: TextStyle(color: Colors.black),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   );
//                 // }).toList(),
//                 items: iconsdetails.map<DropdownMenuItem<ActivityIcons>>(
//                     (ActivityIcons value) {
//                   return DropdownMenuItem<ActivityIcons>(
//                     value: value,
//                     child: Row(
//                       children: <Widget>[
//                         value.icon,
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           value.icontitle,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Row(
//               children: [
//                 Text("Date: "),
//                 FlatButton(
//                   child: Container(
//                       padding: EdgeInsets.all(8),
//                       color: Colors.lightBlue,
//                       child: Text('$displayDate')),
//                   onPressed: () {
//                     _selectdate(context);
//                   },
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text("Time: "),
//                 FlatButton(
//                   child: Container(
//                       padding: EdgeInsets.all(8),
//                       color: Colors.lightBlue,
//                       child: Text('$formattedTimeOfDay')),
//                   onPressed: () {
//                     _selectTime(context);
//                   },
//                 ),
//               ],
//             ),
//             FlatButton(
//               child: Text(
//                 'Add',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               color: Colors.lightBlueAccent,
//               onPressed: () {
//                 menuadd.addmenu(
//                     text: _menucontroller.text,
//                     text1: _submenucontroller.text,
//                     pickdate: displayDate,
//                     picktime: formattedTimeOfDay,
//                     selectedicon: selecteduser);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Provider/dataconstraint.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../Provider/alldata.dart';

class AddMenuScreen extends StatefulWidget {
  @override
  _AddMenuScreenState createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final _actcontroller = TextEditingController();
  final _subactcontroller = TextEditingController();
  DateTime currentdate = DateTime.now();
  TimeOfDay _currenttime = TimeOfDay.now();
  MenuIcons selecteduser;
  FitnessData fitness;

  Future<Null> _selectdate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
      context: context,
      initialDate: currentdate,
      firstDate: currentdate,
      lastDate: currentdate.add(Duration(
        days: 365,
      )),
    );
    if (_seldate != null) {
      setState(() {
        currentdate = _seldate;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay _seltime =
        await showTimePicker(context: context, initialTime: _currenttime);
    if (_seltime != null) {
      setState(() {
        _currenttime = _seltime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(_currenttime);
    var addmenu = Provider.of<FitnessData>(context, listen: false);
    final displayDate = DateFormat.yMMMd().format(currentdate);
    var iconsdetails = Provider.of<FitnessData>(context).iconsmenu;
    fitness = Provider.of<FitnessData>(context, listen: false);

    return Container(
      color: Provider.of<FitnessData>(context).isDarkModeOn
          ? Color(0xFF00002E)
          : Color(0xff757575),
      height: 410,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Provider.of<FitnessData>(context).isDarkModeOn
              ? Color(0xFF00008B)
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _actcontroller,
              decoration: new InputDecoration(
                labelText: "Enter your Menu",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  // borderSide: new BorderSide(),
                ),
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Menu cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _subactcontroller,
              decoration: new InputDecoration(
                labelText: "Enter your SubMenu",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  // borderSide: new BorderSide(),
                ),
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "SubMenu cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              // width: MediaQuery.of(context).size.width - 40,
              child: DropdownButton<MenuIcons>(
                hint: Text("Select icon"),
                value: selecteduser,
                onChanged: (MenuIcons newvalue) {
                  setState(() {
                    selecteduser = newvalue;
                  });
                },
                items: iconsdetails
                    .map<DropdownMenuItem<MenuIcons>>((MenuIcons value) {
                  return DropdownMenuItem<MenuIcons>(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              value.icon,
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.icontitle,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: value.color,
                          radius: 2,
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                Text("Time: "),
                FlatButton(
                  child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.lightBlue,
                      child: Text('$formattedTimeOfDay')),
                  onPressed: () {
                    _selectTime(context);
                  },
                ),
              ],
            ),
            FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  var theControllerMethod = fitness.controller.selectedDay;
                  if (fitness.eventsmenu[fitness.controller.selectedDay] !=
                      null) {
                    print(
                        "-----------------------------sssfasdjfhjkashfdjkhasjkdfhasdfasdfasdfasdfsssssss--------------");

                    // try {
                    //   fitness.addmenu(
                    //       text: _actcontroller.text,
                    //       text1: _subactcontroller.text,
                    //       selectedicon: selecteduser.icon,
                    //       picktime: formattedTimeOfDay,
                    //       controller: theControllerMethod);
                    // } catch (e) {
                    //   print("samanaksdfsadf");
                    // }
                    fitness.addmenu(
                        text: _actcontroller.text,
                        text1: _subactcontroller.text,
                        selectedicon: selecteduser.icon,
                        color: selecteduser.color,
                        picktime: formattedTimeOfDay,
                        controller: theControllerMethod);
                  } else {
                    print(
                        "----------------------sdfjhasjdfhjkashfjkshdfjkhasfd---------------------");

                    fitness.showingTheEventmenu(
                        menu: _actcontroller.text,
                        submenu: _subactcontroller.text,
                        icon: selecteduser.icon,
                        color: selecteduser.color,
                        time: formattedTimeOfDay,
                        controller: theControllerMethod
                        // fitness.addactivity(
                        //   text: _actcontroller.text,
                        //   text1: _subactcontroller.text,
                        //   selectedicon: selecteduser.icon,
                        //   picktime: formattedTimeOfDay,
                        //   controller: theControllerMethod,
                        );
                    print(fitness.eventsmenu);
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

// class AddActivityScreen extends StatefulWidget {
//   @override
//   _AddActivityScreenState createState() => _AddActivityScreenState();
// }

// class _AddActivityScreenState extends State<AddActivityScreen> {
//   final _actcontroller = TextEditingController();
//   final _subactcontroller = TextEditingController();
//   TimeOfDay _currenttime = TimeOfDay.now();
//   Future<Null> _selectTime(BuildContext context) async {
//     final TimeOfDay _seltime =
//         await showTimePicker(context: context, initialTime: _currenttime);
//     if (_seltime != null) {
//       setState(() {
//         _currenttime = _seltime;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var activityadd = Provider.of<FitnessData>(context, listen: false);
//     // final displayDate = DateFormat.yMMMd().format(_currenttime);
//     // final displayTime = DateFormat.jm().format(_currenttime);
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     final formattedTimeOfDay = localizations.formatTimeOfDay(_currenttime);
//     // print(_currenttime);
//     var iconsdetails = Provider.of<FitnessData>(context).icons;
//     ActivityIcons selecteduser;
//     return Container(
//       color: Color(0xff757575),
//       height: 700,
//       child: Container(
//         padding: EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               'Add Activity',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _actcontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter your Activity",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "Activity cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _subactcontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter your SubActivity",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "SubActivity cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 60,
//               width: MediaQuery.of(context).size.width - 40,
//               child: DropdownButton<ActivityIcons>(
//                 hint: Text("Select icon"),
//                 value: selecteduser,
//                 onChanged: (ActivityIcons value) {
//                   setState(() {
//                     selecteduser = value;
//                   });
//                 },
//                 items: iconsdetails.map((ActivityIcons user) {
//                   return DropdownMenuItem<ActivityIcons>(
//                     value: user,
//                     child: Row(
//                       children: <Widget>[
//                         user.icon,
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           user.icontitle,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Row(
//               children: [
//                 Text("Select Time: "),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 FlatButton(
//                   child: Container(
//                       padding: EdgeInsets.all(8),
//                       color: Colors.lightBlue,
//                       child: Text('$formattedTimeOfDay')),
//                   onPressed: () {
//                     _selectTime(context);
//                   },
//                 ),
//               ],
//             ),
//             FlatButton(
//               child: Text(
//                 'Add',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               color: Colors.lightBlueAccent,
//               onPressed: () {
//                 activityadd.addactivity(
//                     text: _actcontroller.text,
//                     text1: _subactcontroller.text,
//                     pick: formattedTimeOfDay,
//                     selectedicon: selecteduser);

//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:fitness_provider/Provider/alldata.dart';
// import 'package:fitness_provider/Provider/dataconstraint.dart';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:provider/provider.dart';

// class AddMenuScreen extends StatefulWidget {
//   @override
//   _AddMenuScreenState createState() => _AddMenuScreenState();
// }

// class _AddMenuScreenState extends State<AddMenuScreen> {
//   final _menucontroller = TextEditingController();
//   final _submenucontroller = TextEditingController();
//   DateTime currentdate = DateTime.now();
//   TimeOfDay _currenttime = TimeOfDay.now();

//   MenuIcons selecteduser;
//   Future<Null> _selectdate(BuildContext context) async {
//     final DateTime _seldate = await showDatePicker(
//       context: context,
//       initialDate: currentdate,
//       firstDate: currentdate,
//       lastDate: currentdate.add(Duration(
//         days: 365,
//       )),
//     );
//     if (_seldate != null) {
//       setState(() {
//         currentdate = _seldate;
//       });
//     }
//   }

//   Future<Null> _selectTime(BuildContext context) async {
//     final TimeOfDay _seltime =
//         await showTimePicker(context: context, initialTime: _currenttime);
//     if (_seltime != null) {
//       setState(() {
//         _currenttime = _seltime;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     final formattedTimeOfDay = localizations.formatTimeOfDay(_currenttime);
//     var menuadd = Provider.of<FitnessData>(context, listen: false);

//     final displayDate = DateFormat.yMMMd().format(currentdate);
//     var iconsdetails = Provider.of<FitnessData>(context).iconsmenu;

//     return Container(
//       color: Color(0xff757575),
//       height: 410,
//       child: Container(
//         padding: EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               'Add Menu',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _menucontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter your Menu",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "Menu cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _submenucontroller,
//               decoration: new InputDecoration(
//                 labelText: "Enter your SubMenu",
//                 fillColor: Colors.white,
//                 border: new OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(25.0),
//                   // borderSide: new BorderSide(),
//                 ),
//               ),
//               validator: (val) {
//                 if (val.length == 0) {
//                   return "SubMenu cannot be empty";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 60,
//               // width: MediaQuery.of(context).size.width - 40,
//               child: DropdownButton<MenuIcons>(
//                 hint: Text("Select icon"),
//                 value: selecteduser,
//                 onChanged: (MenuIcons newvalue) {
//                   setState(() {
//                     selecteduser = newvalue;
//                   });
//                 },
//                 items: iconsdetails
//                     .map<DropdownMenuItem<MenuIcons>>((MenuIcons val) {
//                   return DropdownMenuItem<MenuIcons>(
//                     value: val,
//                     child: Row(
//                       children: <Widget>[
//                         val.icon,
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           val.icontitle,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Row(
//               children: [
//                 Text("Date: "),
//                 FlatButton(
//                   child: Container(
//                       padding: EdgeInsets.all(8),
//                       color: Colors.lightBlue,
//                       child: Text('$displayDate')),
//                   onPressed: () {
//                     _selectdate(context);
//                   },
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text("Time: "),
//                 FlatButton(
//                   child: Container(
//                       padding: EdgeInsets.all(8),
//                       color: Colors.lightBlue,
//                       child: Text('$formattedTimeOfDay')),
//                   onPressed: () {
//                     _selectTime(context);
//                   },
//                 ),
//               ],
//             ),
//             FlatButton(
//               child: Text(
//                 'Add',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               color: Colors.lightBlueAccent,
//               onPressed: () {
//                 menuadd.addmenu(
//                     texts: _menucontroller.text,
//                     texts1: _submenucontroller.text,
//                     pickdate: displayDate,
//                     picktime: formattedTimeOfDay,
//                     selectedicon: selecteduser);

//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
