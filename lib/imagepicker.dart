import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnImageSelected = Function(File imageFile);

class ImagePickerWidget extends StatelessWidget {
  final File imageFile;
  final OnImageSelected onIMageSelected;
  ImagePickerWidget({@required this.imageFile, @required this.onIMageSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: LinearGradient(
              colors: [Colors.cyan[300], Colors.cyan[800]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          image: imageFile != null
              ? DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover)
              : null),
      child: IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () {
          _showPickerOptions(context);
        },
        iconSize: 50,
        color: Colors.white,
      ),
    );
  }

  void _showPickerOptions(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camara"),
                  onTap: () {
                    Navigator.pop(context);
                    _showPickImage(context, ImageSource.camera);
                  }),
              ListTile(
                  leading: Icon(Icons.image_search),
                  title: Text("Galeria"),
                  onTap: () {
                    Navigator.pop(context);
                    _showPickImage(context, ImageSource.gallery);
                  }),
            ],
          );
        });
  }

  void _showPickImage(BuildContext context, source) async {
    var image = await ImagePicker.pickImage(source: source);
    this.onIMageSelected(image);
  }
}
