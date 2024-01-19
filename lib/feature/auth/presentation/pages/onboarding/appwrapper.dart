// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/onboarding/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in.dart';
class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool _showOnboarding = false;

  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showOnboarding = prefs.getBool('showOnboarding') ?? true;

    setState(() {
      _showOnboarding = showOnboarding;
    });
  }

  void completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnboarding', false);

    setState(() {
      _showOnboarding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showOnboarding) {
      return OnboardingScreen(
        onDone: completeOnboarding,
      );
    } else {
      return const SignInScreen();
    }
  }
}
