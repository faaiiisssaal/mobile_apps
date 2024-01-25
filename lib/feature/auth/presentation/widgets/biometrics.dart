// biometric_utils.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

bool isBiometricAvailable = false;
bool isQuickLoginActivated = false;

Future<void> checkBiometricAvailability() async {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  try {
    isBiometricAvailable = await localAuthentication.canCheckBiometrics;
  } on PlatformException catch (e) {
    if (kDebugMode) {
      print("Error checking biometric availability: $e");
    }
    isBiometricAvailable = false;
  }
}

Future<bool> showBiometricAuthenticationDialog(BuildContext context) async {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool authenticated = false;

  try {
    authenticated = await localAuthentication.authenticate(
      localizedReason: 'Verify to access quick login',
    );
  } catch (e) {
    if (kDebugMode) {
      print("Error during biometric authentication: $e");
    }
  }

  return authenticated;
}
