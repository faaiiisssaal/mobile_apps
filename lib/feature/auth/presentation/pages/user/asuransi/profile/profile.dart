import 'package:flutter/material.dart';

class InsuranceProfilePage extends StatefulWidget {
  const InsuranceProfilePage({super.key});

  @override
  State<InsuranceProfilePage> createState() => _InsuranceProfilePageState();
}

class _InsuranceProfilePageState extends State<InsuranceProfilePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffffae00), // Your main color
                  Colors.blue,      // Pure white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
              ),
            ),
          ),
        )
    );
  }
}
