import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appthlete',
      home: Scaffold(
        /*
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Appthlete',
          ),
        ),*/
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 100),
                      width: 250,
                      height: 200,
                      child: Image.network(
                          "https://image.shutterstock.com/image-vector/fitness-symbol-gym-logo-vector-260nw-1429460840.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "USUARIO",
                            border: OutlineInputBorder(),
                          ),
                          controller: emailController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "CONTRASEÑA",
                              border: OutlineInputBorder()),
                          controller: passwordController,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 15.0),
                      child: ElevatedButton(
                        child: Text("Iniciar Sesión"),
                        onPressed: () {
                          context.read<Auth>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10),
                      child: TextButton(
                          child: Text("Registro Deportista"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/registro');
                          }),
                    ),
                    /*Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10),
                      child: TextButton(
                          child: Text("Registro Centro Deportivo"),
                          onPressed: () {
                            return Text("sss");
                          }),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
