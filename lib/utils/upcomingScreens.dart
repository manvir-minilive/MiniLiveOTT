import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildPlaceHolderTab(name) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Column(
        children: <Widget>[
          Text(
            'Oops, the $name page is\n coming soon!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          ),
          Image.asset('assets/images/building.gif'),
        ],
      ),
    ),
  );
}
