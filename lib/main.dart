import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'onboarding/appwrapper.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: true,
      title: 'Flutter Demo',
      home: AppWrapper(),
    );
  }
}
