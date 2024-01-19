import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:helathcareapp/feature/auth/presentation/pages/user/asuransi/content/benefits.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/asuransi/content/claim.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/asuransi/content/hotline.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/asuransi/content/policy.dart';
class InsuranceHomePage extends StatefulWidget {
  const InsuranceHomePage({super.key});

  @override
  State<InsuranceHomePage> createState() => _InsuranceHomePageState();
}

class _InsuranceHomePageState extends State<InsuranceHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 1st row for Information
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
            const SizedBox(
              height: 10,
            ),

            // 2nd row for username
            Container(
              height: 50,
              color: const Color(0xFFdcdcdc),
              width: double.infinity,
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hai, Arta Graha General Insurance",
                    style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    // "Terdaftar sebagai Third-Party Administration (TPA)",
                    "",
                    style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // 3rd row for nearby
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5, left: 0, right: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(
                      "asset/placeholder.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby ...",
                          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // 4th row for our product
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 20,
                ),
                clipBehavior: Clip.hardEdge,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .leftToRight, // Set the transition type left-to-right
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const BenefitsPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Image.asset(
                          "asset/health-insurance.png",
                          color: Colors.red,
                          fit: BoxFit.fill,
                        )),
                        const Text(
                          "Benefits",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .rightToLeft, // Set the transition type right-to-left
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const ClaimPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "asset/claim.png",
                            color: Colors.red,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "Claim",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .leftToRight, // Set the transition type left-to-right
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const PolicyPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "asset/insurance-policy.png",
                            color: Colors.red,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "Policy",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .rightToLeft, // Set the transition type right-to-left
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: const HotlinePage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "asset/247-services.png",
                            color: Colors.red,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "Hotline 24/7",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // 5th row for our location
            Container(
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Image.asset(
                      "asset/247-services.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                      child: Text(
                    "About Us\nSmilynlks\nJl. Pluit Kencana Raya No. 85A\nJakarta Utara, 14450, Indonesia\nTelp : +62 21 6624399\nFax : +62 21 6624299\nEmail : alarmcenter.1@smilynks.co.id",
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.justify,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
