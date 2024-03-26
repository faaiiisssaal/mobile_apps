import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

class HotlineWidget extends StatelessWidget {
  const HotlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: mediawidth(0.25, context),
                child: const Text(
                  "Bebas Pulsa",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(": "),
              const Expanded(
                  child: Text(
                "+62 21 662 4399 ( ext 22/33 )",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            launchPhoneDialer("+62216624399");
          },
          child: const Icon(Icons.call),
        ),
      ],
    );
  }
}

Future<void> launchPhoneDialer(String contactNumber) async {
  final Uri phoneUri = Uri(scheme: "tel", path: contactNumber);
  try {
    if (await launcher.canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  } catch (error) {
    throw ("Cannot dial");
  }
}

Future<void> whatsapp(String wacontact) async {
  var contact = wacontact;
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    if (kDebugMode) {
      print('WhatsApp is not installed.');
    }
  }
}
