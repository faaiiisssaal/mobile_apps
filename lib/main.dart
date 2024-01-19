import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/onboarding/appwrapper.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/onboarding/sign_in.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,

        statusBarColor: Colors.white, // Set your app's background color
        statusBarIconBrightness: Brightness.dark, // Adjust icon color for contrast
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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