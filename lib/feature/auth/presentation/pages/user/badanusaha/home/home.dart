import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/feature/auth/presentation/widgets/hotline.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class EnterpriseHomePage extends StatefulWidget {
  const EnterpriseHomePage({super.key});

  @override
  State<EnterpriseHomePage> createState() => _EnterpriseHomePageState();
}

class _EnterpriseHomePageState extends State<EnterpriseHomePage> {


  String dropDownValue1 = "LALA";
  String dropDownValue2 = "2352352366261116";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: paddingall(10),
        child: Column(
          children: [
            // 1st row for Information
            Container(
              margin: onlytop(25),
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
                    fit: BoxFit.fitHeight,
                  ),
                  Image.asset(
                    'asset/apple-logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                  Image.asset(
                    'asset/google-logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            hp10,

            // 2nd row for username
            Container(
              width: double.infinity,
              padding: paddingall(10),
              decoration: BoxDecoration(
                color: kPureWhite, // Moved the color property to BoxDecoration
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                // You can also add border, shadow etc. here
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hai, Linda",
                    style: TextStyle(fontSize: mediawidth(0.025, context)+2.5, fontWeight: FontWeight.bold),
                  ),
                  hp10,
                  Text(
                    // "Terdaftar sebagai Administration Service Only (ASO)",
                    "sebagai PT Pacific Place Jakarta",
                    style: TextStyle(fontSize: mediawidth(0.0125, context)+2.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            hp10,

            // 3rd row for nearby
            Container(
              width: double.infinity,
              padding: paddingall(10),
              decoration: BoxDecoration(
                color: kPureWhite, // Moved the color property to BoxDecoration
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                // You can also add border, shadow etc. here
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Image.asset(
                      "asset/placeholder.png",
                      height: mediawidth(0.05, context),
                      width: mediawidth(0.05, context),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby ...",
                          style: GoogleFonts.lato(fontSize: mediawidth(0.025, context)+2.5, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                          style: GoogleFonts.lato(fontSize: mediawidth(0.0125, context)+2.5, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            hp10,
            Container(
                height: mediaheight(0.36, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPureWhite, // Moved the color property to BoxDecoration
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                  // You can also add border, shadow etc. here
                ),
                child: Column(
                  children: [

                    // 1st choice member name
                    Container(
                      padding: horiverti(10, 5),
                      decoration: const BoxDecoration(
                        color: kSkyBlue,
                        borderRadius: r15,
                      ),
                      margin: topleftright(10, 10, 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    "Member Name",
                                    style: TextStyle(
                                      fontSize: mediawidth(0.0125, context)+2,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: onlyleft(5),
                                  width: 5,
                                  child: const Text(":"),
                                ),
                                Expanded(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        padding: paddingall(0),
                                        isExpanded: true,
                                        value: dropDownValue1,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropDownValue1 = newValue!;
                                          });
                                        },
                                        items: const [
                                          DropdownMenuItem<String>(
                                            value: "LALA",
                                            child: Text(
                                              "LALA",
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "LILI",
                                            child: Text("LILI"),
                                          ),
                                          DropdownMenuItem(
                                            value: "LULU",
                                            child: Text("LULU"),
                                          ),
                                          DropdownMenuItem(
                                            value: "LELE",
                                            child: Text("LELE"),
                                          ),
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    hp10,


                    Container(
                      padding: paddingall(10),
                      child: ButtonTheme(
                        buttonColor: kSeaBlue,
                        textTheme: ButtonTextTheme.primary,
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          padding: paddingall(0),
                          isExpanded: true,
                          value: dropDownValue1,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue1 = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: "LALA",
                              child: Text(
                                "LALA",
                              ),
                            ),
                            DropdownMenuItem(
                              value: "LILI",
                              child: Text("LILI"),
                            ),
                            DropdownMenuItem(
                              value: "LULU",
                              child: Text("LULU"),
                            ),
                            DropdownMenuItem(
                              value: "LELE",
                              child: Text("LELE"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // constant value from constant.dart
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: const Center(
                          child: Text("No Data"),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            hp10,
            Container(
              width: double.infinity,
              padding: paddingall(10),
              decoration: BoxDecoration(
                color: kPureWhite, // Moved the color property to BoxDecoration
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                // You can also add border, shadow etc. here
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hotline 24/7",
                    style: TextStyle(
                        fontSize: 24
                    ),
                  ),
                  hp10,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: mediawidth(0.1, context),
                                child: const Text("Peserta"),
                              ),
                              const Text(": "),
                              const Text("+62 857 1188 0237"),],
                          ),
                          GestureDetector(
                            onTap: () {
                              launchPhoneDialer("+6285711880237");
                            },
                            child: const Icon(Icons.call),
                          ),
                          GestureDetector(
                            onTap: () {
                              whatsapp("+6285711880237");
                            },
                            child: Image.asset(
                              "asset/whatsapp-logo.png",
                              scale:22.5,
                            ),
                          )
                        ],
                      ),
                      hp10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: mediawidth(0.1, context),
                                child: const Text("Rumah Sakit"),
                              ),
                              const Text(": "),
                              const Text("+62 851 0289 8692"),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              launchPhoneDialer("+6285102898692");
                            },
                            child: const Icon(Icons.call),
                          ),
                          GestureDetector(
                            onTap: () {
                              whatsapp("+6285102898692");
                            },
                            child: Image.asset(
                              "asset/whatsapp-logo.png",
                              scale: 22.5,
                            ),
                          )
                        ],
                      ),
                      hp10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: mediawidth(0.1, context),
                                child: const Text("Bebas Pulsa"),
                              ),
                              const Text(": "),
                              const Text("+62 21 662 4399 ( ext 22/33 )"),],
                          ),
                          GestureDetector(
                            onTap: () {
                              launchPhoneDialer("+62216624399");
                            },
                            child: const Icon(Icons.call),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterpriseQuickLoginStatus {
  static bool quickLoginActivated = false;
}
