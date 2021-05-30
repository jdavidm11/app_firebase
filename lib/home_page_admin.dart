import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_firebase/authentication.dart';
import 'package:provider/provider.dart';

class AdminHomepage extends StatefulWidget {
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  _AdminHomepageState();
  final firebaseInstance = FirebaseFirestore.instance;

  final TextEditingController dateController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController dispController = TextEditingController();

  void addActividad() {
    firebaseInstance.collection("Actividades").add({
      "Nombre": nameController.text.trim(),
      "Fecha": dateController.text.trim(),
      "Cupo": dispController.text.trim(),
    });
    nameController.clear();
    dateController.clear();
    dispController.clear();
    SnackBar(content: Text("Actividad Agregada"));
  }

  void showUsers() {
    firebaseInstance.collection("Usuarios").get().then((resultados) {
      resultados.docs.forEach((elementos) {
        print(elementos.data());
      });
    });
  }

  findUSer() {
    String llenarDatos = "";
    firebaseInstance
        .collection("Usuarios")
        .where("nombre", isEqualTo: "Jesus")
        .snapshots()
        .listen((resultados) {
      resultados.docs.forEach((elementos) {
        print(elementos.data());
        String datos = elementos.data() as String;
        llenarDatos = datos;
      });
    });
    return llenarDatos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido, Admin"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              context.read<Auth>().signOut();
            },
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 40,
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Actividad",
                        border: OutlineInputBorder(),
                      ),
                      controller: nameController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 40,
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Hora",
                        border: OutlineInputBorder(),
                      ),
                      controller: dateController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 40,
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Cupo",
                        border: OutlineInputBorder(),
                      ),
                      controller: dispController,
                    ),
                  ),
                ),
                RaisedButton(
                    onPressed: () => addActividad(),
                    child: Text("Agregar Actividad")),
                SizedBox(
                  height: 20,
                ),
                ListaActividades()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListaActividades extends StatefulWidget {
  ListaActividades({Key key}) : super(key: key);

  @override
  _ListaActividadesState createState() => _ListaActividadesState();
}

class _ListaActividadesState extends State<ListaActividades> {
  @override
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
          stream:
              FirebaseFirestore.instance.collection('Actividades').snapshots(),
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
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 22,
                    child: Text("Actividad: " +
                        document['Nombre'] +
                        "  Cupo: " +
                        document['Cupo'].toString()),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue.shade50.withOpacity(0.4)),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
