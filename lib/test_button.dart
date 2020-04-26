import 'package:flutter/material.dart';

import 'colors.dart';

class TestButton extends StatelessWidget {
  final String text;
  final Function click;

  TestButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
        color: Colors.blueAccent,
        onPressed: () {
          click();
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: colorFont),
        ),
      ),
    );
  }
}
