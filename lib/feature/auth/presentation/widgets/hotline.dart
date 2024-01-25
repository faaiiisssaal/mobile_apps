import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

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

Future<void> whatsapp(String wacontact) async{
  var contact = wacontact;
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