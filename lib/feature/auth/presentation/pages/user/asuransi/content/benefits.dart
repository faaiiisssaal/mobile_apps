import 'package:flutter/material.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: const Center(
          child: Text(
            'Your Benefits Content Here',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
