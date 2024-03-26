// profile.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/form/form.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/profile/about.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/profile/ecard.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/profile/guide.dart';

import 'package:healthcareapp/presentation/widgets/biometrics.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import the biometric_utils.dart file

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _appVersion = "Unknown";

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  String? companyName;
  String? policyNo;
  String? cardNo;
  String? empID;
  String? memberID;
  String? memberName;
  String? classNo;
  String? memberSex;
  String? memberPlan;
  String? memberBirthDate;
  String? effectiveDate;
  String? ipDetail;
  String? opDetail;

  Future<void> getDataLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      companyName = pref.getString("companyName");
      policyNo = pref.getString("policyNo");
      cardNo = pref.getString("cardNo");
      empID = pref.getString("empID");
      memberID = pref.getString("memberID");
      memberName = pref.getString("memberName");
      classNo = pref.getString("classNo");
      memberSex = pref.getString("memberSex");
      memberPlan = pref.getString("memberPlan");
      memberBirthDate = pref.getString("memberBirthDate");
      effectiveDate = pref.getString("effectiveDate");
      ipDetail = pref.getString("ipDetail");
      opDetail = pref.getString("opDetail");
    });
  }

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                // Navigator.pop(context);
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAccountInfoDialog(BuildContext context, String name, String memID, String fam, String policyNo, String dOB, String eP, String plan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kSkyBlue,
          actionsPadding: paddingall(10),
          contentPadding: paddingall(10),
          title: const Text('Account Information'),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              child: Column(
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
                          maxLines: 3,
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
                            child: Text(
                              name,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 12),
                            )
                        ),
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
                      Expanded(
                        child: Container(
                            padding: onlyleft(10),
                            child: Text(
                              memID,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 12),
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
                      Expanded(
                        child: Container(
                          padding: onlyleft(10),
                          child: Text(
                            fam,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ))
                      )],
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
                      Expanded(
                        child: Container(
                          padding: onlyleft(10),
                          child: Text(
                            policyNo,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ))
                      )],
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
                      Expanded(
                        child: Container(
                          padding: onlyleft(10),
                          child: Text(
                            dOB,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ))
                      )],
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
                            child: Text(
                              eP,
                              style: const TextStyle(fontSize: 12),
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
                            child: Text(
                              plan,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 12),
                            )),
                      )
                    ],
                  ),
                  // Add more information here
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
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
    getDataLogin();
    // Call the function to check biometric availability
    checkBiometricAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Placeholder(
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
                        _showAccountInfoDialog(context, memberName!, empID!, classNo!, policyNo!, memberBirthDate!, effectiveDate!, memberPlan!);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.badge_outlined),
                      title: const Text('My e-Card'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ECardPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text('Form'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormPage()),
                        );
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
      
                          MemberQuickLoginStatus.quickLoginActivated = isQuickLoginActivated;
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
                              content: const Text('Are you sure you want to exit the app?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () async {
                                    // Dismiss the dialog and navigate to the login page
                                    Navigator.of(context).pop();
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                    Navigator.of(context).pushReplacementNamed('/sign_in');
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove("user");
                                    if (kDebugMode) {
                                      print(
                                          "MemberQuickLoginStatus.quickLoginActivated: ${MemberQuickLoginStatus.quickLoginActivated}");
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
      ),
    );
  }
}
