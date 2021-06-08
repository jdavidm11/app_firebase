import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth firebaseAuth;

  Auth(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      SnackBar(
        content: Text('Usuario y/o contraseña incorrecta'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      return e.message;
    }
  }

  Future<String> createAccount({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut({String email, String password}) async {
    try {
      await firebaseAuth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}
