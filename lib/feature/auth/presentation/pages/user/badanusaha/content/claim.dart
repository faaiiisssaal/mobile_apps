import 'package:flutter/material.dart';

class ClaimPage extends StatelessWidget {
  const ClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: const Center(
          child: Text(
            'Your Claim Content Here',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
