import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:standoff2_cheat_menu/screens/Free_menu_page.dart';

class FreePage extends StatefulWidget {
  const FreePage({Key? key}) : super(key: key);

  @override
  State<FreePage> createState() => _FreePageState();
}

class _FreePageState extends State<FreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 75),
            child: Text(
              "❤Free Cheat❤",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "by @dadada.dart",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 235, left: 15, right: 15),
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          child: const FreeCheatScreen()));
                },
                child: const Text(
                  "Go to the free cheat menu",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Kanit",
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
