import 'package:flutter/material.dart';
import 'package:flutter_app/test_button.dart';
import 'package:intl/intl.dart';
import '../code_performance_test.dart';
import '../colors.dart';
import '../main.dart';

class TestsWidget extends StatelessWidget {

  void displayDialog(String text, BuildContext context){

    AlertDialog alert = AlertDialog(
      title: Text(text),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void displayResult(num time, BuildContext context){
    displayDialog(time.toString() + " ms", context);
  }

  void displayResults(List<num> times, BuildContext context){
    displayDialog(times[0].toString() + " ms, " + times[1].toString() + " ms", context);
  }

  void clickSort(BuildContext context) {
    displayResults(testCodePerformance(100000), context);
  }

  void clickNative(BuildContext context) async {
    double time = await testNativeEmptyMethod();
    displayResult(time, context);
  }

  void clickNative2(int count, BuildContext context) async {
    int time = await testNativeGetData(count);
    displayResult(time, context);
  }

  void onClickLaunchTime(BuildContext context){
    final df = new DateFormat('hh:mm:ss.SSS');

    String i = df.format(start) +" " + df.format(renderTime); 
    displayDialog(i, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Column(
        children: <Widget>[
          TestButton("SORTOWANIE LISTY OBIEKTÓW", () => {clickSort(context)}),
          TestButton("PUSTA METODA NATYWNA", () => {clickNative(context)}),
          TestButton("POBRANIE LISTY (100)", () => {clickNative2(100, context)}),
          TestButton("POBRANIE LISTY (1000)", () => {clickNative2(1000, context)}),
          TestButton("POBRANIE LISTY (10000)", () => {clickNative2(10000, context)}),
          TestButton("CZAS WYśWIETLENIA", () => {onClickLaunchTime(context)})

    ],
      ),
    );
  }
}