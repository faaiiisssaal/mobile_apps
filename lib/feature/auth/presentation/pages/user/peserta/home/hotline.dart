import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

class HotlinePage extends StatelessWidget {
  const HotlinePage({super.key});

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );
    try {
      if (await launcher.canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      }
    } catch (error) {
      throw("Cannot dial");
    }
  }

  Future<void> whatsapp() async{
    var contact = "+6281314937905";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      if (kDebugMode) {
        print('WhatsApp is not installed.');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  launchPhoneDialer("+6281314937905");
                },
                child: const Text('Call'),
              ),
              ElevatedButton(
                onPressed: () async {
                  whatsapp();
                },
                child: const Text('WA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
