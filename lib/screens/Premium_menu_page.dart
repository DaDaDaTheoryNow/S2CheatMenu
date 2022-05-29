import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:standoff2_cheat_menu/screens/Premium_page.dart';

class PremiumCheatScreen extends StatefulWidget {
  const PremiumCheatScreen({Key? key}) : super(key: key);

  @override
  State<PremiumCheatScreen> createState() => _PremiumCheatScreenState();
}

class _PremiumCheatScreenState extends State<PremiumCheatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("It is Premium Cheat Menu"),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () {},
              child: const Text("Soon..."),
            )
          ],
        ),
      ),
    );
  }
}
