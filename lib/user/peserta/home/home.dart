import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/user/peserta/content/benefits.dart';
import 'package:helathcareapp/user/peserta/content/claim.dart';
import 'package:helathcareapp/user/peserta/content/hotline.dart';
import 'package:helathcareapp/user/peserta/content/policy.dart';
import 'package:page_transition/page_transition.dart';

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
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              child: ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset(
                    'asset/whatsapp-logo.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/apple-logo.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/google-logo.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // the first row for greetings
            Container(
              height: 60,
              color: const Color(0xFFdcdcdc),
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hai, Faisal Setiadi",
                    style: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    // "Terdaftar sebagai Third-Party Administration (TPA)",
                    "Terdaftar di Perusahaan ABCXYZ",
                    style: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nearby ...",
                    style: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                    style: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // the second row for provider
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
                clipBehavior: Clip.antiAlias,
                shrinkWrap: true,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                        PageTransition(
                          type: PageTransitionType.leftToRight, // Set the transition type left-to-right
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const BenefitsPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/health-insurance.png",
                            height: 60,
                            color: Colors.red,
                          ),
                          const Text(
                            "Benefits",
                            style: TextStyle(
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft, // Set the transition type right-to-left
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const ClaimPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/healthcare.png",
                            height: 60,
                            color: Colors.red,
                          ),
                          const Text(
                            "Claim",
                            style: TextStyle(
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight, // Set the transition type left-to-right
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const PolicyPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/insurance-policy.png",
                            height: 60,
                            color: Colors.red,
                          ),
                          const Text(
                            "Policy",
                            style: TextStyle(
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft, // Set the transition type right-to-left
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const HotlinePage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/247-services.png",
                            height: 60,
                            color: Colors.red,
                          ),
                          const Text(
                              "Hotline 24/7",
                            style: TextStyle(
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // the third row for information

            // the fourth row for about me
            Expanded(
              flex: 15,
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
