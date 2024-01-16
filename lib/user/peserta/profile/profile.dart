// profile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'biometrics.dart'; // Import the biometric_utils.dart file

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Call the function to check biometric availability
    checkBiometricAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(
              child: ListView(
                children: [
                  // ... Your existing ListTiles
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Quick Login'),
                    onTap: () {
                      if (isBiometricAvailable) {
                        // Show biometric authentication dialog
                        showBiometricAuthenticationDialog(context);
                      } else {
                        // Biometric authentication is not available on this device
                        // Handle accordingly (e.g., show a message)
                        if (kDebugMode) {
                          print("Biometric authentication is not available on this device.");
                        }
                      }
                    },
                  ),
                  // ... Add more ListTiles as needed
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Exit App'),
                    onTap: () {
                      // Show a confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Exit'),
                            content: const Text('Are you sure you want to exit the app?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Dismiss the dialog and navigate to the login page
                                  Navigator.of(context).pop();
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                  Navigator.of(context).pushReplacementNamed('/login');
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Dismiss the dialog
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
