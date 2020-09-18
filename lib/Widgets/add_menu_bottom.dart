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
                        controller: theControllerMethod);
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
