import 'package:flutter/material.dart';

import 'onboarding/appwrapper.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black, // Set your desired primary color
        hintColor: Colors.lightBlueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Set the default background color for ElevatedButton
          ),
        ),// Set your desired accent color
        // Add more color-related properties as needed
      ),
      home: const AppWrapper(),
    );
  }
}
