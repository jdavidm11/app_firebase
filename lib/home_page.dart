import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';
//import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firebaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendario'),
              onTap: () {
                Navigator.pushNamed(context, '/calendario');
              },
            ),
            ListTile(
                leading: Icon(Icons.local_activity),
                title: Text('Actividades'),
                onTap: () {
                  Navigator.pushNamed(context, '/actividadesview');
                }),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                context.read<Auth>().signOut();
              },
            ),
          ],
        ),
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
                  /*Container(
                      height: 300,
                      width: 300,
                      color: Colors.blue,
                      child: DynamicEvent()),*/
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Image.network(
                        'https://i0.wp.com/revolucionpersonal.com/wp-content/uploads/2018/01/frases-gym2.jpg?fit=2250%2C1500&ssl=1'),
                  ),

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
                  Text(
                    '¡ BIENVENIDO !',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.blue[700],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(' Que tengas un buen dia de entrenamiento!',
                      style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
