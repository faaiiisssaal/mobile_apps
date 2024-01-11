import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              flex: 15,
              child: Container(
                // Your content for the first row
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                // Your content for the second row
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                // Your content for the third row
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                // Your content for the fourth row
                color: Colors.yellow,
                child: const Text("TEST"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
