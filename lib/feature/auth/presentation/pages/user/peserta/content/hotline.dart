import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HotlinePage extends StatelessWidget {
  const HotlinePage({super.key});

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );
    try {
      if (await launcher.canLaunchUrl(phoneUri.toString() as Uri)) {
        await launchUrl(phoneUri.toString() as Uri);
      }
    } catch (error) {
      throw("Cannot dial");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              launchPhoneDialer("+62-813-1493-7905");
            },
            child: const Text('Call'),
          ),
        ),
      ),
    );
  }
}
