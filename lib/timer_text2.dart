import 'package:flutter/material.dart';

import 'colors.dart';

class TimerText2 extends StatefulWidget {
  final Stream<String> stream;

  TimerText2({this.stream});

  @override
  State<StatefulWidget> createState() {
    return new TimerText2State();
  }
}

class TimerText2State extends State<TimerText2> {
  String textToDisplay = "0";

  @override
  void initState() {
    super.initState();
    widget.stream.listen((text) {
      setState(() {
        textToDisplay = text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(color: colorFont, fontSize: 50),
      textScaleFactor: 1.0,
    );
  }
}
