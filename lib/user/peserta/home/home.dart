import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

            // the first row for greetings
            Expanded(
              flex: 15,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hai, Faisal Setiadi",
                      style: GoogleFonts.raleway(
                        fontSize: 14
                      ),
                    ),
                    Text(
                      // "Terdaftar sebagai Third-Party Administration (TPA)",
                      "Terdaftar sebagai Administration Service Only (ASO)",
                      style: GoogleFonts.raleway(
                          fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // the second row for provider
            Expanded(
              flex: 25,
              child: Container(
                color: Colors.green,
                child: const LimitedBox(
                  maxHeight: 0.8,
                  child: Text("LALALA"),
                ),
              ),
            ),

            // the third row for information
            Expanded(
              flex: 40,
              child: Container(
                // Your content for the third row
                color: Colors.blue,
              ),
            ),

            // the fourth row for about me
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
