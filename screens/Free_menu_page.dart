import 'package:flutter/material.dart';

class FreeCheatScreen extends StatefulWidget {
  const FreeCheatScreen({Key? key}) : super(key: key);

  @override
  State<FreeCheatScreen> createState() => _FreeCheatScreenState();
}

class _FreeCheatScreenState extends State<FreeCheatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("It is Free Cheat Menu"),
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
