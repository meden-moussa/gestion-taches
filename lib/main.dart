import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/auth/login.dart';
import 'package:to_do_list/creation_tache.dart';
import 'package:to_do_list/firebase_options.dart';
import 'package:to_do_list/list_taches.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: 'OpenSans', primaryColor: Colors.blueAccent),
        home: const Login(),
        routes: {
          "login": (context) => const Login(),
          "creerTache": (context) => const CreationTache(),
          "listTaches": (context) => const ListTache(),
        },
      ),
    );
  }
}
