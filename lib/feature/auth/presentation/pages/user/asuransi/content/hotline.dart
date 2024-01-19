import 'package:flutter/material.dart';

class HotlinePage extends StatelessWidget {
  const HotlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: const Center(
          child: Text(
            'Your Hotline Content Here',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
