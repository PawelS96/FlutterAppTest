import 'package:flutter/services.dart';
import 'package:flutter_app/person.dart';

List<int> testCodePerformance(int rows) {
  var text = generateText(rows);
  var stopWatch = new Stopwatch()..start();

  var personList = List<Person>();
  var lines = text.split("\n");

  lines.forEach((line){
        var props = line.split(",");
        var name = props[0];
        var surname = props[1];
        personList.add(new Person(name, surname));
      });

  var textToListTIme = stopWatch.elapsedMilliseconds;
  stopWatch.reset();

  personList.sort((m1, m2) {
    var r = m1.surname.compareTo(m2.surname);
    if (r != 0) return r;
    return m1.name.compareTo(m2.name);
  });

  var sortTime = stopWatch.elapsedMilliseconds;

  return [textToListTIme, sortTime];
}

const channel = const MethodChannel('nativeChannel');

Future<double> testNativeEmptyMethod() async {
  Stopwatch sw = new Stopwatch()..start();
  await channel.invokeMethod('emptyMethod');
  return (sw.elapsedMicroseconds / 1000);
}

Future<int> testNativeGetData(int count) async {
  Stopwatch sw = new Stopwatch()..start();
  new List<String>.from(
      await channel.invokeMethod('getData', {"count": count}));
  return sw.elapsedMilliseconds;
}
