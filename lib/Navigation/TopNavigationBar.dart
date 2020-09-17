import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/alldata.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.dehaze,
            size: 30.0,
            color: Provider.of<FitnessData>(context).isDarkModeOn
                ? Colors.white
                : Color(0xFF000099),
          ),
          Icon(
            Icons.show_chart,
            size: 30.0,
            color: Provider.of<FitnessData>(context).isDarkModeOn
                ? Colors.white
                : Color(0xFF000099),
          ),
          IconButton(
              icon: Icon(
                Icons.add_alert,
                color: Provider.of<FitnessData>(context).isDarkModeOn
                    ? Colors.white
                    : Color(0xFF000099),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
