import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Provider/dataconstraint.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddActivityScreen extends StatefulWidget {
  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  @override
  Widget build(BuildContext context) {
    String newmenu;
    String newsubmenu;
    // String dropdownValue = 'One';
    // int _value = 1;
    // var activityadd = Provider.of<FitnessDetails>(context).activity;
    // var activitydetails = Provider.of<FitnessData>(context).data;
    // var menudetails = Provider.of<FitnessData>(context).menu;

    // List<DropdownMenuItem<ActivityIcons>> _dropdownMenuItems;

    // ActivityIcons _selectedItem;
    return Container(
      color: Color(0xff757575),
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
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newmenu = newText;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newsubmenu = newText;
              },
            ),
            // DropdownButton<String>(
            //   // value: dropdownValue,
            //   icon: Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (String newValue) {
            //     // setState(() {
            //     //   dropdownValue = newValue;
            //     // });
            //   },
            //   items: <String>['One', 'Two', 'Free', 'Four']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // // DropdownButton<ActivityIcons>(
            //   value: dropdownValue,
            //   icon: Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (String newValue) {
            //     setState(() {
            //       dropdownValue = newValue;
            //     });
            //   },
            //   // items: <String>['One', 'Two', 'Free', 'Four']
            //   //     .map<DropdownMenuItem<String>>((String value) {
            //   //   return DropdownMenuItem<String>(
            //   //     value: value,
            //   //     child: Text(value),
            //   //   );
            //   // }).toList(),
            // ),

            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<FitnessData>(context)
                    .addactivity(newmenu, newsubmenu);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
    // TextEditingController etUsername = new TextEditingController();
    // return Container(
    //   padding: EdgeInsets.all(20.0),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(20.0),
    //       topRight: Radius.circular(20.0),
    //     ),
    //   ),
    //   child: Form(
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(top: 35.0),
    //         ),

    //         Text(
    //           'Register Form',
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
    //         ),

    //         TextFormField(
    //           controller: etUsername,
    //           decoration: InputDecoration(hintText: 'Input Username'),
    //         ),

    //         //notification widget
    //         //toast
    //         //alert dialog
    //         //snack bar
    //         FlatButton(
    //           child: Text(
    //             'Add',
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //           color: Colors.lightBlueAccent,
    //           onPressed: () {
    //             Provider.of<FitnessData>(context)
    //                 .addactivity(newmenu, newsubmenu);

    //             Navigator.pop(context);
    //           },
    //         ),
    //         Container(
    //           alignment: Alignment.centerRight,
    //           child: MaterialButton(
    //             onPressed: () {
    //               print('jajkjkasjk');
    //               return showDialog(
    //                 context: context,
    //                 builder: (context) {
    //                   return AlertDialog(
    //                     // Retrieve the text the that user has entered by using the
    //                     // TextEditingController.
    //                     content:
    //                         Text(etUsername.text), //menampilkan object ke text
    //                   );
    //                 },
    //               );
    //             },
    //             color: Colors.orange,
    //             textColor: Colors.white,
    //             child: Text('Submit'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
  }
}
