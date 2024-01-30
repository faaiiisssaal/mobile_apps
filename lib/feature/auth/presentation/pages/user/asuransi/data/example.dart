import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helathcareapp/main.dart';

void runAppWithJsonData() {
  String jsonString = '''
  {
    "policies": [
      {
        "policy_no": "ihqwiqohfoiqwf",
        "details": [
          {
            "name": "ur09w37ur937r093",
            "EP": "7t49hklgwhwge",
            "AM": "u8yite4th4hgt234l",
            "P": "hie3yoi2gi23ghi32",
            "TNC": "uejfijueofjhuo3jfg",
            "FP": "8238575080-870"
          },
          {
            "name": "ur09w37ur937r093",
            "EP": "7t49hklgwhwge",
            "AM": "u8yite4th4hgt234l",
            "P": "hie3yoi2gi23ghi32",
            "TNC": "uejfijueofjhuo3jfg",
            "FP": "8238575080-870"
          }
        ]
      },
      {
        "policy_no": "jrgh31uirg1j2yr219",
        "details": [
          {
            "name": "ur09w37ur937r093",
            "EP": "7t49hklgwhwge",
            "AM": "u8yite4th4hgt234l",
            "P": "hie3yoi2gi23ghi32",
            "TNC": "uejfijueofjhuo3jfg",
            "FP": "8238575080-870"
          },
          {
            "name": "ur09w37ur937r093",
            "EP": "7t49hklgwhwge",
            "AM": "u8yite4th4hgt234l",
            "P": "hie3yoi2gi23ghi32",
            "TNC": "uejfijueofjhuo3jfg",
            "FP": "8238575080-870"
          }
        ]
      }
    ]
  }
  ''';

  Map<String, dynamic> jsonData = json.decode(jsonString);
  runApp(MyApp.fromJsonData(jsonData));
}
