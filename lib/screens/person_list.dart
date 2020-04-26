import 'package:flutter/material.dart';
import 'package:flutter_app/person.dart';

import '../colors.dart';

class PersonList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonState(getPersonList());
  }
}

class PersonState extends State<PersonList> {
  final List<Person> person;

  PersonState(this.person);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        itemCount: person.length,
        physics: const AlwaysScrollableScrollPhysics (),
        itemBuilder: (context, index) {
          return Container(
              color: colorPrimary,
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(7),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          person[index].surname,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          person[index].name,
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 24,
                        )),
                  )
                ],
              ));
        });
  }
}
