import 'dart:async';
import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/home/provider.dart';
import 'package:helathcareapp/presentation/widgets/hotline.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/information.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    } else if (hour < 16) {
      return 'Selamat Siang';
    } else if (hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  Timer? timer;
  DateTime? _currentTime;
  late AnimationController _controller;
  String _timeOfDay = '';

  void _updateTimeOfDay() {
    int? currentHour = _currentTime?.hour;
    int? currentMin = _currentTime?.minute;
    if (currentHour! >= 6 && currentHour < 12) {
      _timeOfDay = 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 15) {
      _timeOfDay = 'Good Afternoon';
    } else if (currentHour >= 15 || currentHour < 16 && currentMin! <= 29) {
      _timeOfDay = 'Good Evening';
    } else if (currentHour >= 18 && currentHour < 24 && currentMin! >= 25) {
      _timeOfDay = 'Good Night';
    } else {
      _timeOfDay = 'Late Night';
    }
  }

  String? cP;
  String? pN;
  String? cN;
  String? eI;
  String? mI;
  String? mN;
  String? clN;
  String? mS;
  String? mP;
  String? mBD;
  String? eD;
  String? iD;
  String? oD;

  Future<void> getDataLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      cP = pref.getString("companyName");
      pN = pref.getString("policyNo");
      cN = pref.getString("cardNo");
      eI = pref.getString("empID");
      mI = pref.getString("memberID");
      mN = pref.getString("memberName");
      clN = pref.getString("classNo");
      mS = pref.getString("memberSex");
      mP = pref.getString("memberPlan");
      mBD = pref.getString("memberBirthDate");
      eD = pref.getString("effectiveDate");
      iD = pref.getString("ipDetail");
      oD = pref.getString("opDetail");
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLogin();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      if (mounted) {
        // Check if the widget is mounted
        setState(() {
          _currentTime = DateTime.now();
          _updateTimeOfDay();
        });
      }
    });

    // Set up the initial time
    _currentTime = DateTime.now();
    // Set up a timer to update the current time every minute
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        _updateTimeOfDay();
      });
    });
    // Start the animation
    _controller.repeat();
  }

  @override
  void dispose() {
    // Dispose of the timer
    timer?.cancel();
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          scrolledUnderElevation: 0.0,
          automaticallyImplyLeading: false,
          leading: Image.asset(
            "asset/smilynks.png",
            fit: BoxFit.cover,
          ),
          leadingWidth: 120,
        ),
        body: SingleChildScrollView(
          padding: paddingall(20),
          child: Column(
            children: [
              // 1st row for username
              Container(
                width: double.infinity,
                padding: paddingall(10),
                decoration: const BoxDecoration(
                  color: kSkyBlue, // Moved the color property to BoxDecoration
                  borderRadius: r10, // Adjust the radius as needed
                  // You can also add border, shadow etc. here
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$_timeOfDay,\n$mN",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_currentTime?.hour.toString().padLeft(2, '0')}:${_currentTime?.minute.toString().padLeft(2, '0')}:${_currentTime?.second.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          // "Terdaftar sebagai Administration Service Only (ASO)",
                          "registered at $cP",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              hp20,
              // 2nd row for nearby
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nearby",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MapsPage.routeName);
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  hp10,
                  Container(
                    width: mediawidth(1, context),
                    padding: paddingall(10),
                    decoration: const BoxDecoration(
                      color: kSkyBlue, // Moved the color property to BoxDecoration
                      borderRadius: r10, // Adjust the radius as needed
                      // You can also add border, shadow etc. here
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "asset/placeholder.png",
                          height: mediawidth(0.085, context),
                          width: mediawidth(0.085, context),
                        ),
                        wp10,
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Salemba, Jakarta Selatan",
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              hp20,
              // 3rd row for Information
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  hp10,
                  Container(
                    padding: paddingall(10),
                    decoration: const BoxDecoration(
                      color: kSkyBlue, // Moved the color property to BoxDecoration
                      borderRadius: r10, // Adjust the radius as needed
                      // You can also add border, shadow etc. here
                    ),
                    child: ImageSlideShow().build(context),
                  ),
                ],
              ),
              hp20,
              // 5th for hotline
              Container(
                width: double.infinity,
                padding: paddingall(10),
                decoration: const BoxDecoration(
                  color: kSkyBlue, // Moved the color property to BoxDecoration
                  borderRadius: r10, // Adjust the radius as needed
                  // You can also add border, shadow etc. here
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hotline 24/7",
                      style: TextStyle(
                        fontSize: mediawidth(0.075, context),
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
