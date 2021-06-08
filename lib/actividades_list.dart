import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Actividadeslist extends StatefulWidget {
  @override
  _ActividadeslistState createState() => _ActividadeslistState();
}

class _ActividadeslistState extends State<Actividadeslist> {
  final firebaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('acts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return ListTile(
                  title: Text("Actividad: " + document['Nombre']),
                  trailing: Text('Cupo: ' + document['Cupo'].toString()),
                  onTap: () {
                    //Navigator.pushNamed(context, '/apuntarse');
                    int cup = document['Cupo'];
                    String acti = "'" + document['Nombre'] + "'";
                    print(cup);
                    apuntarseActividad(cup, acti);
                    print(cup);
                  },
                );
              }).toList(),
              padding: EdgeInsets.all(2.0),
            );
          },
        ),
      ),
    );
  }

  void apuntarseActividad(int cup, String acti) {
    firebaseInstance.collection('act').doc(acti).update({
      "Cupo": (cup - 1),
    });
  }
}
