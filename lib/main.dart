import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/tests_widget.dart';
import 'package:flutter_app/screens/person_list.dart';
import 'package:flutter_app/screens/timer_screen_stateful.dart';
import 'colors.dart';

DateTime start;

void main(){

  start = DateTime.now();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: colorPrimary,
      statusBarColor: colorPrimary
    ));

    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
DateTime renderTime;

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => {onRender("timer")});
  }

  void onRender(String widget){
    renderTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          bottom: TabBar(
            tabs: [
              Tab(text: "LISTA",),
              Tab(text: "STOPER",),
              Tab(text: "TESTY",),
            ],
          ),
        ),
        body: TabBarView(children: [
          PersonList(),
          TimerScreen2(),
          TestsWidget()
        ])

          //Center(child: PersonList()),
      ),
    );
  }

}

