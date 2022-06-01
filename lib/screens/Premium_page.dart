// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:standoff2_cheat_menu/helped_assets/Raised_button_gradient.dart';
import 'package:standoff2_cheat_menu/screens/Premium_menu_page.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

bool buyNow = true;
String _key = " ";
bool activate_now = false;
bool premium_cheat_work = false;

final TextEditingController _keyController = TextEditingController();

final Stream<QuerySnapshot> PricePremiumCheat =
    FirebaseFirestore.instance.collection("...").snapshots();

class _PremiumPageState extends State<PremiumPage> {
  PremiumCheatWorkActive() async {
    final prefs = await SharedPreferences.getInstance();
    premium_cheat_work = prefs.getBool("...")!;
  }

  PremiumCheatSet() async {
    final prefs = await SharedPreferences.getInstance();
    premium_cheat_work = await prefs.setBool("...", true);
  }

  @override
  Widget build(BuildContext context) {
    Widget ActivateKey() {
      if (activate_now == true) {
        return FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("...")
              .doc("...")
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              Fluttertoast.showToast(
                  msg: "Something went wrong",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              Fluttertoast.showToast(
                  msg: "Document not found",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.requireData;
              _key = _keyController.text;

              List index = [];

              for (var i = 1; i < 11; i++) {
                index.add("key$i");
              }

              if (_key == data[index[0]] ||
                  _key == data[index[1]] ||
                  _key == data[index[2]] ||
                  _key == data[index[3]] ||
                  _key == data[index[4]] ||
                  _key == data[index[5]] ||
                  _key == data[index[6]] ||
                  _key == data[index[7]] ||
                  _key == data[index[8]] ||
                  _key == data[index[9]]) {
                Fluttertoast.showToast(
                    msg: "Your key has been activated",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 15.0);
                premium_cheat_work = true;
              } else {
                Fluttertoast.showToast(
                    msg:
                        "Your key is not accepted, please check if the key is correct",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }

              if (snapshot.connectionState == ConnectionState.none) {
                Fluttertoast.showToast(
                    msg: "Check your internet connection",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
            return Text(
              "You are handsome)",
              style: TextStyle(
                color: Colors.grey,
              ),
            );
          },
        );
      } else {}
      return GestureDetector(
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Telegram group: \n",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              TextSpan(
                text: "t.me/MyFlutterProjects",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ])),
        onTap: () async {
          final url = "https://t.me/MyFlutterProjects";

          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      );
    }

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 75),
            child: Text(
              "Premium Cheat🔑",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "by @dadada.dart",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MyOutlinedButton(
                onPressed: () {
                  if (premium_cheat_work == false) {
                    Fluttertoast.showToast(
                        msg: "Key not activated",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                  if (premium_cheat_work == true) {
                    Fluttertoast.showToast(
                        msg: "Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600),
                            child: PremiumCheatScreen()));
                  }
                },
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.pink, Colors.amber]),
                child: Text(
                  'Go to the premium cheat menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster",
                  ),
                ),
              ),
            ),
          ),
          (buyNow
              ? GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 74, bottom: 15),
                    child: Text(
                      "If you want to activate your key, click on this text",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      buyNow = false;
                    });
                  },
                )
              : GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 72, bottom: 15),
                    child: Text("If you want to buy key, click on this text",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  onTap: () {
                    setState(() {
                      buyNow = true;
                    });
                  },
                )),
          Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                controller: _keyController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                toolbarOptions:
                    ToolbarOptions(paste: false, selectAll: true, cut: false),
                decoration: InputDecoration(
                  hintText: "Write your key, please!",
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54, width: 2)),
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: Icon(
                          Icons.key_outlined,
                          size: 25,
                          shadows: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                      )),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                (buyNow
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            final url = "https://qiwi.com/n/SPARY670";

                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                "Buy now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            setState(() {
                              activate_now = true;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 250), () {
                              setState(() {
                                activate_now = false;
                              });
                            });
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                "Activate",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                Padding(
                  padding: EdgeInsets.only(),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: PricePremiumCheat,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong...",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 17, 0),
                                fontSize: 30,
                                fontFamily: "Blaka",
                              ));
                        }
                        if (snapshot.connectionState == ConnectionState.none) {
                          Fluttertoast.showToast(
                              msg: "Check your internet connection",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            "Loading...",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 17, 0),
                              fontSize: 30,
                              fontFamily: "Blaka",
                            ),
                          );
                        }

                        final data = snapshot.requireData;

                        //return Text("price is ${data.docs[0]["price"]} now");
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Live price: ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 17, 0),
                                      fontSize: 30,
                                      fontFamily: "Blaka",
                                    )),
                                TextSpan(
                                    text: "${data.docs[0]["price"]}",
                                    style: TextStyle(
                                      fontFamily: "Blaka",
                                      fontSize: 30,
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                ActivateKey()
              ],
            ),
          )
        ],
      ),
    ));
  }
}
