// profile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'biometrics.dart'; // Import the biometric_utils.dart file

class EnterpriseProfilePage extends StatefulWidget {
  const EnterpriseProfilePage({super.key});

  @override
  State<EnterpriseProfilePage> createState() => _EnterpriseProfilePageState();
}

class _EnterpriseProfilePageState extends State<EnterpriseProfilePage> {
  String _appVersion = "Unknown";

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAppVersion();
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
                  const ListTile(
                    leading: Icon(Icons.perm_identity_outlined),
                    title: Text('My Account'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.badge_outlined),
                    title: Text('My e-Card'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.menu_book_sharp),
                    title: Text('Manual Guide'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.fingerprint_rounded),
                    title: const Text('Quick Login'),
                    trailing: Switch(
                      value: isQuickLoginActivated,
                      onChanged: (value) async {
                        setState(() {
                          isQuickLoginActivated = value;
                        });

                        QuickLoginStatus.quickLoginActivated = isQuickLoginActivated;

                        if (isBiometricAvailable) {
                          // Prompt for biometric authentication
                          bool authenticated = await showBiometricAuthenticationDialog(context);

                          if (authenticated) {
                            // Biometric authentication successful
                            // Additional logic if needed
                            if (kDebugMode) {
                              print("Biometric authentication successful.");
                            }
                          } else {
                            // Biometric authentication failed or canceled
                            // Handle accordingly (e.g., show a message)
                            if (kDebugMode) {
                              print("Biometric authentication failed or canceled.");
                            }
                          }
                        }
                      },
                    ),
                    onTap: () {
                      if (isBiometricAvailable && isQuickLoginActivated) {
                        // Show biometric authentication dialog
                        showBiometricAuthenticationDialog(context);
                      } else {
                        // Handle accordingly (e.g., show a message)
                        if (kDebugMode) {
                          print(
                              "Biometric authentication is not available or Quick Login is deactivated.");
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(
              //   "Copyrights, ${DateTime.now().year} \u00a9 PT Abadi Smilynks. All rights reserved.",
              //   maxLines: 1,
              //   softWrap: true,
              //   textAlign: TextAlign.center,
              // ),
              // const SizedBox(height: 4.0),
              Text(
                'App Version: $_appVersion',
                style: const TextStyle(fontSize: 12.5, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickLoginStatus {
  static bool quickLoginActivated = false;
}
