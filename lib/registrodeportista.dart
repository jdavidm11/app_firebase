import 'dart:io';
import 'package:flutter/material.dart';
import 'imagepicker.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';

class RegistroDeportista extends StatefulWidget {
  @override
  _RegistroDeportistaState createState() => _RegistroDeportistaState();
}

class _RegistroDeportistaState extends State<RegistroDeportista> {
  File imageFile;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Deportista'),
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
                  SizedBox(
                    height: 20,
                  ),
                  ImagePickerWidget(
                      imageFile: this.imageFile,
                      onIMageSelected: (File file) {
                        setState(() {
                          imageFile = file;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 250,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Nombres", border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 250,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Apellidos",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 250,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "E-mail",
                                border: OutlineInputBorder()),
                            controller: emailController,
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 250,
                          height: 40,
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Confirmar E-mail",
                                  border: OutlineInputBorder())))),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 250,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              border: OutlineInputBorder(),
                            ),
                            controller: passwordController,
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 250,
                          height: 40,
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Confirmar Contraseña",
                                  border: OutlineInputBorder())))),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 15.0),
                    child: ElevatedButton(
                      child: Text("Registrarse"),
                      onPressed: () {
                        registro(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registro(BuildContext context) {
    Navigator.pop(context);
    print("Registro");
    context.read<Auth>().createAccount(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }
}
