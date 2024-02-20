// profile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/pages/user/asuransi/home/home.dart';
import 'package:helathcareapp/presentation/pages/user/asuransi/profile/about.dart';
import 'package:helathcareapp/presentation/pages/user/asuransi/profile/guide.dart';
import 'package:helathcareapp/presentation/widgets/biometrics.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import the biometric_utils.dart file

class InsuranceProfilePage extends StatefulWidget {
  const InsuranceProfilePage({super.key});

  @override
  State<InsuranceProfilePage> createState() => _InsuranceProfilePageState();
}

class _InsuranceProfilePageState extends State<InsuranceProfilePage> {
  String _appVersion = "Unknown";

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  void _showAccountInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kSkyBlue,
          actionsPadding: paddingall(10),
          contentPadding: paddingall(10),
          title: const Text('Account Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // name
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Name",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Container(
                      padding: onlyleft(10),
                      child: const Text(
                        "Faisal Setiadi",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "No.",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Container(
                      padding: onlyleft(10),
                      child: const Text(
                        "610026424",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Family",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Container(
                      padding: onlyleft(10),
                      child: const Text(
                        "2",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Policy No.",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Container(
                      padding: onlyleft(10),
                      child: const Text(
                        "01008615000123",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Date of Birth",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Container(
                      padding: onlyleft(10),
                      child: const Text(
                        "September 3, 1996",
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Effective Plan",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Expanded(
                    child: Container(
                        padding: onlyleft(10),
                        child: const Text(
                          "Jan 01 2024 to Dec 31 2024",
                          style: TextStyle(fontSize: 12),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      "Plan",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: onlyleft(5),
                    width: 5,
                    child: const Text(":"),
                  ),
                  Expanded(
                    child: Container(
                        padding: onlyleft(10),
                        child: const Text(
                          "II",
                          maxLines: 2,
                          style: TextStyle(fontSize: 12),
                        )),
                  )
                ],
              ),
              // Add more information here
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
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
    return Placeholder(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(Icons.perm_identity_outlined),
                    title: const Text('My Account'),
                    onTap: () {
                      _showAccountInfoDialog(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.file_open),
                    title: const Text('Manual Guide'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GuidePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About Smilynks'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutPage()),
                      );
                    },
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

                        InsuranceQuickLoginStatus.quickLoginActivated = isQuickLoginActivated;
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
                                    print(
                                        "InsuranceQuickLoginStatus.quickLoginActivated: ${InsuranceQuickLoginStatus.quickLoginActivated}");
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
