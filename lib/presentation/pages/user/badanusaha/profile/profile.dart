// profile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/pages/user/badanusaha/home/home.dart';
import 'package:helathcareapp/presentation/widgets/biometrics.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    leading: Icon(Icons.menu_book_sharp),
                    title: Text('Manual Guide'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.fingerprint_outlined),
                    title: const Text('Quick Login'),
                    trailing: Switch(
                      value: isQuickLoginActivated,
                      onChanged: (value) async {
                        // Don't change switch state if verification is in progress
                        if (isVerificationInProgress) {
                          return;
                        }

                        // If user is turning on the switch
                        if (value) {
                          bool authenticated = false;
                          if (isBiometricAvailable) {
                            // Prompt for biometric authentication
                            setState(() {
                              isVerificationInProgress = true; // Set flag "switch" to true
                            });

                            authenticated = await showBiometricAuthenticationDialog(context);

                            setState(() {
                              isVerificationInProgress = false; // Reset flag "switch"
                            });
                          }

                          if (authenticated) {
                            // If biometric verification is successful, switch to ON position
                            setState(() {
                              isQuickLoginActivated = true;
                            });
                          } else {
                            // If biometric verification failed or was canceled, keep the switch off
                            setState(() {
                              isQuickLoginActivated = false;
                            });

                            // Handle accordingly (e.g., show a message)
                            if (kDebugMode) {
                              print("Biometric verification failed or was canceled. Switch remains off.");
                            }
                          }
                        } else {
                          // If user is turning off the switch
                          setState(() {
                            isQuickLoginActivated = value;
                          });
                        }

                        EnterpriseQuickLoginStatus.quickLoginActivated = isQuickLoginActivated;
                      },
                    ),
                    onTap: () {
                      if (isBiometricAvailable && isQuickLoginActivated && !isVerificationInProgress) {
                        // Show biometric authentication dialog
                        showBiometricAuthenticationDialog(context);
                      } else {
                        // Handle accordingly (e.g., show a message)
                        if (kDebugMode) {
                          print(
                              "Biometric authentication is not available, Quick Login is deactivated, or verification is in progress.");
                        }
                      }
                    },
                  ),
                  // ... Add more ListTiles as needed
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Exit'),
                    onTap: () {
                      // Show a confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Exit'),
                            content: const Text('Are you sure you want to exit?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  // Dismiss the dialog and navigate to the login page
                                  Navigator.of(context).pop();
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                  Navigator.of(context).pushReplacementNamed('/login');
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.remove("user");

                                  if (kDebugMode) {
                                    print("EnterpriseQuickLoginStatus.quickLoginActivated: "
                                        "${EnterpriseQuickLoginStatus.quickLoginActivated}");
                                  }
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
          padding: horiverti(2.5, 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
