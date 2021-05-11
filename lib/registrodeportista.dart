import 'dart:io';
import 'package:flutter/material.dart';
import 'imagepicker.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroDeportista extends StatefulWidget {
  @override
  _RegistroDeportistaState createState() => _RegistroDeportistaState();
}

class _RegistroDeportistaState extends State<RegistroDeportista> {
  final TextEditingController emailController = TextEditingController();
  final firebaseInstance = FirebaseFirestore.instance;
  final TextEditingController genreController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  File imageFile;

  void registro(BuildContext context) {
    Navigator.pop(context);
    print("Registro");
    context.read<Auth>().createAccount(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }

  void addUser() {
    firebaseInstance.collection("Usuarios").add({
      "Nombre": nameController.text.trim(),
      "Apellido": surnameController.text.trim(),
      "Sexo": genreController.text.trim(),
    });
  }

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
                        controller: nameController,
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
                          controller: surnameController),
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
                                  labelText: "Genero",
                                  border: OutlineInputBorder()),
                              controller: genreController))),
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
                        addUser();
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
}
