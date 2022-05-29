import 'package:flutter/material.dart';
import 'package:standoff2_cheat_menu/screens/Home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Standoff  2  Cheat  ",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: "Kanit",
                  )),
              TextSpan(
                text: "Menu",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.red,
                  fontFamily: "Kanit",
                ),
              ),
            ])),
          ),
        ),
        body: const HomePage(),
      ),
      theme: ThemeData.dark(),
    );
  }
}
