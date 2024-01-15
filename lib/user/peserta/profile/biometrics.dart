// biometric_utils.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

bool isBiometricAvailable = false;

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

Future<void> showBiometricAuthenticationDialog(BuildContext context) async {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool authenticated = false;

  try {
    authenticated = await localAuthentication.authenticate(
      localizedReason: 'Authenticate to access quick login',
      // biometricOnly: true,
    );
  } catch (e) {
    print("Error during biometric authentication: $e");
  }

  if (authenticated) {
    // User successfully authenticated with biometrics
    // Add your logic to proceed with quick login
    print("Biometric authentication successful. Proceeding with quick login.");
  } else {
    // Biometric authentication failed or user canceled
    // Handle accordingly (e.g., show a message)
    print("Biometric authentication failed or canceled.");
  }
}
