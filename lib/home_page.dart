import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';
import 'package:prueba_firebase/home_page_admin.dart';
//import 'package:table_calendar/table_calendar.dart';

import 'dynamic_event.dart';

class HomePage extends StatelessWidget {
  final firebaseInstance = FirebaseFirestore.instance;

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
                      height: 300,
                      width: 300,
                      color: Colors.blue,
                      child: DynamicEvent()),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                  ),
                  ListaActividades(),
                  //UsuariosFirebase(),
                  /*RaisedButton(
                    onPressed: () {
                      showUsers();
                      findUSer();
                    },
                    child: Text("leer y encontrar"),
                  ),*/
                  SizedBox(
                    height: 10,
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

class UsuariosFirebase extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 400,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueAccent.withOpacity(0.2)),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Usuarios').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                    child: Text("Nombre: " +
                        document['Nombre'] +
                        "  Apellido: " +
                        document['Apellido']));
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
