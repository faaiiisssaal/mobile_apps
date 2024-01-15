import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 64),
        ),
      ),
      title: 'Smilynks',
      home: const AppWrapper(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyScreen(),
//     );
//   }
// }
//
// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> {
//   int currentLayer = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Layer Switching'),
//       ),
//       body: Stack(
//         children: [
//           // Layer 1
//           Visibility(
//             visible: currentLayer == 1,
//             child: Container(
//               color: Colors.blue,
//               child: Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       currentLayer = 2;
//                     });
//                   },
//                   child: Text('Switch to Layer 2'),
//                 ),
//               ),
//             ),
//           ),
//           // Layer 2
//           Visibility(
//             visible: currentLayer == 2,
//             child: Container(
//               color: Colors.green,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           currentLayer = 3;
//                         });
//                       },
//                       child: Text('Switch to Layer 3'),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           currentLayer = 1;
//                         });
//                       },
//                       child: Text('Back to Layer 1'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Layer 3
//           Visibility(
//             visible: currentLayer == 3,
//             child: Container(
//               color: Colors.orange,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           currentLayer = 2;
//                         });
//                       },
//                       child: Text('Back to Layer 2'),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           currentLayer = 1;
//                         });
//                       },
//                       child: Text('Back to Layer 1'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
