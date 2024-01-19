import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: const Center(
          child: Text(
            'Your Policy Content Here',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
