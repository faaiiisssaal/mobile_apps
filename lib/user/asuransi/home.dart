import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsuranceHomePage extends StatefulWidget {
  const InsuranceHomePage({super.key});

  @override
  State<InsuranceHomePage> createState() => _InsuranceHomePageState();
}

class _InsuranceHomePageState extends State<InsuranceHomePage> {
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
                      "Hai, Maylinda",
                      style: GoogleFonts.raleway(
                        fontSize: 14
                      ),
                    ),
                    Text(
                      "ArtaGraha General Insurance",
                      // "Terdaftar sebagai Third-Party Administration (TPA)",
                      // "Terdaftar sebagai Administration Service Only (ASO)",
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
                // Your content for the second row
                color: Colors.green,
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
