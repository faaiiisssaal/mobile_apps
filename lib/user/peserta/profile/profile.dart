// profile.dart

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
        body: Container(
          // ... Your existing code
          child: Column(
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
                      leading: Icon(Icons.login),
                      title: Text('Quick Login'),
                      onTap: () {
                        if (isBiometricAvailable) {
                          // Show biometric authentication dialog
                          showBiometricAuthenticationDialog(context);
                        } else {
                          // Biometric authentication is not available on this device
                          // Handle accordingly (e.g., show a message)
                          print("Biometric authentication is not available on this device.");
                        }
                      },
                    ),
                    // ... Add more ListTiles as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
