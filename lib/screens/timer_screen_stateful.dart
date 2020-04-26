import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/test_button.dart';

import '../colors.dart';
import '../timer_text2.dart';


class TimerScreen2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new TimerScreen2State();
  }
}

class TimerScreen2State extends State<TimerScreen2> {
  StreamController<String> _controller = StreamController<String>.broadcast();

  int time = 0;
  bool isRunning = false;
  int delay = 20;

  Timer timer;

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }
  void startTimer() {

    time = 0;

    timer = Timer.periodic(new Duration(milliseconds: delay), (Timer timer) {
      _updateTime();
    });
  }

  void stopTimer() {
    if (timer != null)
    timer.cancel();
  }

  void onClick() {

    setState(() {
      isRunning = !isRunning;
    });

    if (!isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void _updateTime() {
    time ++;
    _controller.add(time.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Center(
                child: Column(children: <Widget>[
                  for (int i = 0; i < 5; i++)
                    TimerText2(stream: _controller.stream)
                ])),
          ),
          Align(alignment: Alignment.bottomCenter, child: displayBottom())
        ],
      ),
    );
  }

  Widget displayBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TestButton(isRunning ? "STOP" : "START", onClick),
        Visibility(
          visible: !isRunning,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Slider(
            value: delay / 10 - 1,
            min: 0,
            max: 9,
            onChanged: (progress) =>
                {setState(() => delay = (progress.toInt() + 1) * 10)},
          ),
        ),
        Visibility(
          visible: !isRunning,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Text(
            delay.toString() + " ms",
            style: TextStyle(color: colorFont, fontSize: 15),
          ),
        )
      ],
    );
  }
}
