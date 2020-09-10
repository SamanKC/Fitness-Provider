import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Provider/dataconstraint.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddMenuScreen extends StatefulWidget {
  @override
  _AddMenuScreenState createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final _menucontroller = TextEditingController();
  final _submenucontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var menuadd = Provider.of<FitnessData>(context, listen: false);

    return Container(
      color: Color(0xff757575),
      height: 400,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
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
              controller: _menucontroller,
              decoration: new InputDecoration(
                labelText: "Enter menu",
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
              controller: _submenucontroller,
              decoration: new InputDecoration(
                labelText: "Enter submenu",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  // borderSide: new BorderSide(),
                ),
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Submenu cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
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
                menuadd.addmenu(
                    text: _menucontroller.text, text1: _submenucontroller.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
