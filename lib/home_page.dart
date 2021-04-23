import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';
//import 'package:table_calendar/table_calendar.dart';

import 'dynamic_event.dart';

class HomePage extends StatelessWidget {
  //final int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 500,
                      width: 400,
                      color: Colors.blue,
                      child: DynamicEvent()),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<Auth>().signOut();
                    },
                    child: Text("Sign out"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
