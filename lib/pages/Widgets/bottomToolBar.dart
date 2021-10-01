import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.transparent,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(
              5,
              (index) => Container(
                    height: 40,
                    width: 40,
                    color: Colors.purple,
                  ))));
  }
  
}
