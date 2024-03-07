// biometric_utils.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart'
    show AndroidAuthMessages, AuthMessages, AuthenticationOptions, BiometricType;
import 'package:local_auth_ios/local_auth_ios.dart';

bool isBiometricAvailable = false;
bool isQuickLoginActivated = false;
bool isVerificationInProgress = false; // Flag to track biometric verification status

Future<void> checkBiometricAvailability() async {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  try {
    List<BiometricType> availableBiometrics = await localAuthentication.getAvailableBiometrics();

    isBiometricAvailable = availableBiometrics.contains(BiometricType.strong);
    if (kDebugMode) {
      print(isBiometricAvailable);
    }
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
        localizedReason: 'Please Authenticate',
        options: const AuthenticationOptions(
            useErrorDialogs: false
            //   biometricOnly: true,
            // stickyAuth: true,
            // sensitiveTransaction: true
            ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            biometricHint: 'Place your finger on the sensor to verify',
            biometricNotRecognized: 'Not recognized. Try again.',
            biometricSuccess: 'Verified!',
            cancelButton: 'Cancel',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);
  } catch (e) {
    if (kDebugMode) {
      print("Error during biometric authentication: $e");
    }
  }

  return authenticated;
}
