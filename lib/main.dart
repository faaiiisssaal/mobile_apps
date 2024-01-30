import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/onboarding/appwrapper.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/gatepass/sign_in.dart';
import 'package:helathcareapp/feature/common/constant.dart';

Future<void> main() async {
  runApp(const MyApp(jsonData: {},));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.jsonData});

  final Map<String, dynamic> jsonData;

  factory MyApp.fromJsonData(Map<String, dynamic> jsonData) {
    return MyApp(jsonData: jsonData);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(

        // NavigationBar
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: kLightBlue,
        systemNavigationBarIconBrightness: Brightness.dark,

        // StatuBar
        systemStatusBarContrastEnforced: true,
        statusBarColor: kLightBlue,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kLightBlue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
      ),
      title: 'Smilynks',
      home: const AppWrapper(),
      initialRoute: "/",
      routes: {
        '/login': (context) => const SignInScreen(),
        // Add more routes as needed
      },
    );
  }
}