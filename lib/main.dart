import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:prueba_firebase/actividades_list.dart';
import 'package:prueba_firebase/authentication.dart';
import 'package:prueba_firebase/dynamic_event.dart';
import 'package:prueba_firebase/home_page.dart';
import 'package:prueba_firebase/login.dart';
import 'package:prueba_firebase/registrodeportista.dart';
import 'package:prueba_firebase/home_page_admin.dart';

import 'apuntarseActividad.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<Auth>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Appthlete',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: AuthenticationWrapper(),
        routes: {
          '/registro': (context) => RegistroDeportista(),
          '/calendario': (context) => DynamicEvent(),
          '/actividadesview': (context) => Actividadeslist(),
          '/apuntarse': (context) => Apuntarse(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      if (firebaseUser.toString().contains("admin")) {
        print(firebaseUser.toString());
        return AdminHomepage();
      }
      return HomePage();
    }
    return SignInPage();
  }
}
