import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/home/provider.dart';
import 'package:helathcareapp/presentation/widgets/hotline.dart';
import 'package:helathcareapp/presentation/widgets/information.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dropDownValue1 = "LALA";
  String dropDownValue2 = "2352352366261116";
  String dropDownValue3 = "Rawat Jalan";

  String selectedOption = "46546545";

  final Map<String, Map<String, String>> optionsData = {
    "46546545": {
      "A": "Value for A - Option 1",
      "B": "Value for B - Option 1",
      "C": "Value for C - Option 1",
      "D": "Value for D - Option 1",
      "E": "Value for E - Option 1",
    },
    "46546000": {
      "A": "Value for A - Option 2",
      "B": "Value for B - Option 2",
      "C": "Value for C - Option 2",
      "D": "Value for D - Option 2",
      "E": "Value for E - Option 2",
    },
  };

  String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 15) {
      return 'Selamat Siang';
    } else if (hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  Timer? timer;

  int tapCount = 0;

  Future<void> showExitPopup(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Tekan sekali lagi untuk keluar"),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getGreeting();
    timer = Timer.periodic(const Duration(milliseconds: 500), ((timer) {
      getGreeting();
    }));
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false, //When false, blocks the current route from being popped.
      onPopInvoked: (didPop) async {
        showExitPopup(context);
      },
      child: SafeArea(
        child: SingleChildScrollView(
          padding: paddingall(10),
          child: Column(
            children: [

              // 1st row for username
              Container(
                width: double.infinity,
                padding: paddingall(10),
                decoration: const BoxDecoration(
                  color: kPureWhite, // Moved the color property to BoxDecoration
                  borderRadius: r20, // Adjust the radius as needed
                  // You can also add border, shadow etc. here
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${getGreeting()}\nLinda",
                      style: TextStyle(fontSize: mediawidth(0.045, context), fontWeight: FontWeight.bold),
                    ),
                    hp10,
                    Text(
                      // "Terdaftar sebagai Administration Service Only (ASO)",
                      "terdaftar di karyawan PT Pacific Place Jakarta",
                      style: TextStyle(fontSize: mediawidth(0.035, context), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              hp10,

              // 2nd row for Information
              Container(
                child: ImageSlideShow().build(context),
              ),
              hp10,

              // 3rd row for nearby
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, MapsPage.routeName);
                },
                child: Container(
                  width: mediawidth(1, context),
                  padding: paddingall(10),
                  decoration: const BoxDecoration(
                    color: kPureWhite, // Moved the color property to BoxDecoration
                    borderRadius: r20, // Adjust the radius as needed
                    // You can also add border, shadow etc. here
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "asset/placeholder.png",
                        height: mediawidth(0.085, context),
                        width: mediawidth(0.085, context),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nearby ...",
                              style: TextStyle(fontSize: mediawidth(0.05, context), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: mediawidth(0.025, context), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              hp10,
              Container(
                  height: mediaheight(0.36, context),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kPureWhite, // Moved the color property to BoxDecoration
                    borderRadius: r20, // Adjust the radius as needed
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
                                        fontSize: mediawidth(0.025, context),
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
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "LALA",
                                              child: Text(
                                                "LALA",
                                                style: TextStyle(
                                                  fontSize: mediawidth(0.025, context),
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: "LILI",
                                              child: Text(
                                                "LILI",
                                                style: TextStyle(
                                                  fontSize: mediawidth(0.025, context),
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: "LULU",
                                              child: Text(
                                                "LULU",
                                                style: TextStyle(
                                                  fontSize: mediawidth(0.025, context),
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: "LELE",
                                              child: Text(
                                                "LELE",
                                                style: TextStyle(
                                                  fontSize: mediawidth(0.025, context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
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
                            value: dropDownValue3,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue3 = newValue!;
                              });
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: "Rawat Jalan",
                                child: Text(
                                  "Rawat Jalan",
                                  style: TextStyle(
                                    fontSize: mediawidth(0.025, context),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Rawat Inap",
                                child: Text(
                                  "Rawat Inap",
                                  style: TextStyle(
                                    fontSize: mediawidth(0.025, context),
                                  ),
                                ),
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
                          margin: bottomleftright(10, 10, 10),
                          child: const Center(
                            child: Text("No Data"),
                          ),
                        ),
                      ),
                    ],
                  )),
              hp10,
              Container(
                width: double.infinity,
                padding: paddingall(10),
                decoration: const BoxDecoration(
                  color: kPureWhite, // Moved the color property to BoxDecoration
                  borderRadius: r20, // Adjust the radius as needed
                  // You can also add border, shadow etc. here
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hotline 24/7",
                      style: TextStyle(
                        fontSize: mediawidth(0.085, context),
                      ),
                    ),
                    hp10,
                    const HotlineWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // Dispose of the timer when the widget is disposed
  //   timer.cancel();
  //   super.dispose();
  // }
}

class MemberQuickLoginStatus {
  static bool quickLoginActivated = false;
}

class MemberSession {
  bool session = false;
}
