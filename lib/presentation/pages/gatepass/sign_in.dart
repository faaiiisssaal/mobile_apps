// ignore_for_file: unused_field, unused_element

import 'package:helathcareapp/common/constant.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helathcareapp/presentation/pages/gatepass/forgot%20_member.dart';
import 'package:helathcareapp/presentation/pages/gatepass/forgot_insurance.dart';
import 'package:helathcareapp/presentation/pages/user/asuransi/home/home.dart';
import 'package:helathcareapp/presentation/pages/user/asuransi/navigation/navbar.dart';
import 'package:helathcareapp/presentation/pages/user/badanusaha/home/home.dart';
import 'package:helathcareapp/presentation/pages/user/badanusaha/navigation/navbar.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/home/home.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/navigation/navbar.dart';
import 'package:helathcareapp/presentation/widgets/biometrics.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/userdata.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign_in';

  const SignInScreen({super.key});

  @override
  createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = false;
  final TextEditingController _insuranceEmailController = TextEditingController();
  final TextEditingController _insurancePassController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPassController = TextEditingController();
  final TextEditingController _membermemberController = TextEditingController();
  final TextEditingController _memberdateController = TextEditingController();

  bool _useCompany = true;
  bool _useInsurance = true;
  bool _useMember = true;

  UserData userData = UserData(
    companyEmail: '',
    companyPass: '',
    insuranceEmail: '',
    insurancePass: '',
    memberId: '',
    dateOfBirth: DateTime.now(),
  );

  void _showCalendar(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _memberdateController.text = DateFormat('yyyy-M-dd').format(selectedDate);
      });
    }
  }

  void switchInputType() {
    setState(() {
      if (_useMember) {
        // Reset data based on the current input type (Member)
        _membermemberController.clear();
        _memberdateController.clear();
        userData.memberId = '';
        userData.dateOfBirth = DateTime.now();
      } else if (_useInsurance) {
        // Reset data based on the current input type (Company)
        _insuranceEmailController.clear();
        _insurancePassController.clear();
        userData.insuranceEmail = '';
        userData.insurancePass = '';
      } else {
        // Reset data based on the current input type (Insurance)
        _companyEmailController.clear();
        _companyPassController.clear();
        userData.companyEmail = '';
        userData.companyPass = '';
      }

      // Switch input type
      _useMember = !_useMember;
      _useCompany = false;
      _useInsurance = false;
    });
  }

  void switchCompanyInputType() {
    setState(() {
      if (_useCompany) {
        // Reset data based on the current input type (Company)
        _companyEmailController.clear();
        _companyPassController.clear();
        userData.companyEmail = '';
        userData.companyPass = '';
      } else {
        // Reset data based on the current input type (Insurance)
        _insuranceEmailController.clear();
        _insurancePassController.clear();
        userData.insuranceEmail = '';
        userData.insurancePass = '';
      }

      // Switch input type
      _useCompany = !_useCompany;
      _useInsurance = !_useInsurance;
    });
  }

  void switchToMember() {
    setState(() {
      _useMember = true;
      _useCompany = false;
      _useInsurance = false;
    });
  }

  void switchToCompany() {
    setState(() {
      _useMember = false;
      _useCompany = true;
      _useInsurance = false;
    });
  }

  void switchToInsurance() {
    setState(() {
      _useMember = false;
      _useCompany = false;
      _useInsurance = true;
    });
  }

  void saveUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user);
  }

  String memberResult = "";
  String compResult = "";
  String insurResult = "";

  void loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("user");
    String? areResult = prefs.getString("user");
    if (kDebugMode) {
      print(result);
      print(areResult);
    }

    setState(() {
      if (result == "member") {
        switchToMember();
        memberResult = "member";
      } else if (result == "company") {
        switchToCompany();
        compResult = "company";
      } else if (result == "insurance") {
        switchToInsurance();
        insurResult = "insurance";
      } else {
        switchToMember();
      }
    });
  }

  void signInMemTemp() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavBar(),
      ),
    );
  }

  void signInInsuTemp() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InsuranceNavBar(),
      ),
    );
  }

  void signInCompTemp() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EnterpriseNavBar(),
      ),
    );
  }

  void signIn() {
    final String enteredMemberId = _membermemberController.text.trim();
    final String enteredDoB = _memberdateController.text.trim();

    // Verify against fake data
    if (enteredMemberId == "610026424-2" && enteredDoB == "2023-9-30") {
      // Successful login
      if (kDebugMode) {
        print("Member Login Successful");
      }

      // Clear form data
      _membermemberController.clear();
      _memberdateController.clear();

      // Show circular progress while transitioning
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Simulate some async operation before navigating (replace with your actual logic)
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the loading dialog
        // Navigate to the home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      });
    } else {
      // Display an error message
      if (kDebugMode) {
        print("Member Login Error: Invalid Member ID or Date of Birth");
      }

      // Show a floating Snackbar for login error
      _showFloatingSnackbar('Invalid Member ID or Date of Birth. Please try again.');
    }
  }

  void _showFloatingSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: r10,
        ),
        margin: paddingall(10),
        padding: horiverti(24, 12),
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
      ),
    );
  }

  void signInInsurance() {
    final String enteredInsuranceID = _insuranceEmailController.text;
    final String enteredInsurancePass = _insurancePassController.text;

    // Verify against fake data
    if (enteredInsuranceID == "0987654321" && enteredInsurancePass == "1234567890") {
      // Successful login
      if (kDebugMode) {
        print("Insurance Login Successful");
      }

      // Clear form data
      _insuranceEmailController.clear();
      _insurancePassController.clear();

      // Show circular progress while transitioning
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Simulate some async operation before navigating (replace with your actual logic)
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the loading dialog
        // Navigate to the home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const InsuranceNavBar()),
        );
      });
    } else {
      // Display an error message
      if (kDebugMode) {
        print("Insurance Login Error: Invalid ID or Password");
      }

      // Show a floating Snackbar for login error
      _showFloatingSnackbarInsurance('Invalid ID or Password. Please try again.');
    }
  }

  void _showFloatingSnackbarInsurance(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: r10,
        ),
        margin: paddingall(10),
        padding: horiverti(24, 12),
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
      ),
    );
  }

  void signInCompany() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EnterpriseNavBar(),
      ),
    );
  }

  String _appVersion = "Unknown"; // Default value

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  final GlobalKey<ScaffoldMessengerState> _memberScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldMessengerState> _companyScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldMessengerState> _insuranceScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    loadUser();
    _getAppVersion(); // Call this method to get the app version during initialization
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPureWhite,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: paddingall(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1st Row "Logo" Position
                    Container(
                        height: screenHeight * 0.18,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'asset/smilynks.png',
                              filterQuality: FilterQuality.high,
                              width: screenHeight * 0.35,
                            ),
                          ],
                        )),

                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    if (_useMember) ...[
                      buildMemberSection(),
                    ],
                    if (!_useMember) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!_useCompany) ...[
                            buildInsuranceSection(),
                          ],
                          if (_useCompany) ...[
                            buildCompanySection(),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: horizontal(2.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: kPureWhite,
                child: Text(
                  "Copyrights, ${DateTime.now().year} \u00a9 PT Abadi Smilynks. All rights reserved.",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              // Text("${MemberSession().session}"),
              // Text("${EnterpriseSession().session}"),
              // Text("${InsuranceSession().session}"),
              //
              // Text("$_useMember"),
              // Text("$_useCompany"),
              // Text("$_useInsurance")

              // const SizedBox(height: 4.0),
              // Text(
              //   'App Version: $_appVersion',
              //   style: const TextStyle(fontSize: 12.5, color: Colors.grey),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMemberSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Member ID
        TextFormField(
          controller: _membermemberController,
          decoration: const InputDecoration(
            hintText: 'Member ID',
            prefixIcon: Icon(Icons.person_outline_rounded),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            MemberIDInputFormatter(),
          ],
          onChanged: (value) {
            setState(() {
              userData.memberId = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        // Member DoB
        GestureDetector(
          onTap: () async {
            _showCalendar(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _memberdateController,
              decoration: const InputDecoration(
                hintText: 'Date of Birth',
                prefixIcon: Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotMemberSection(),
                ),
              );
            },
            child: const Text(
              "Forgot your account?",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        // Sign In Button
        ElevatedButton(
          onPressed: () {
            // if (_membermemberController.text.isEmpty || _memberdateController.text.isEmpty) {
            //   // Show a Snackbar for missing fields
            //   _showFloatingSnackbar('Please fill in the form');
            // } else {
            //   signIn();
            // }
            signInMemTemp();
            saveUser("member");
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
          child: const Text('Sign In as Member'),
        ),
        const SizedBox(height: 10.0),
        MemberQuickLoginStatus.quickLoginActivated == true
            ? const Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: kDarkRed,
                          height: 7.5,
                          thickness: 3,
                          indent: 0,
                          endIndent: 5,
                        ),
                      ),
                      Text("OR"),
                      Expanded(
                        child: Divider(
                          color: kPureBlue,
                          height: 7.5,
                          thickness: 3,
                          indent: 5,
                          endIndent: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                ],
              )
            : Container(),
        // Biometrics
        MemberQuickLoginStatus.quickLoginActivated == true
            ? ElevatedButton(
                onPressed: () async {
                  // Trigger biometric authentication logic
                  bool authenticated = await showBiometricAuthenticationDialog(context);

                  if (authenticated) {
                    // Biometric authentication successful
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NavBar()),
                      );
                    }
                  } else {
                    // Biometric authentication failed or canceled
                    if (kDebugMode) {
                      print("Biometric authentication failed or canceled.");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Biometrics Login'),
              )
            : Container(),

        memberResult == "member"
            ? Container()
            :
            // Switch
            GestureDetector(
                onTap: () {
                  switchInputType();
                  if (kDebugMode) {
                    print("Switch to Insurance");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: vertical(10.0),
                  child: Text(
                    _useMember ? 'Switch to Insurance' : 'Switch to Member',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget buildCompanySection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _companyEmailController,
          decoration: const InputDecoration(
            hintText: 'Company ID',
            prefixIcon: Icon(Icons.person_outline_rounded),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            setState(() {
              userData.companyEmail = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          controller: _companyPassController,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            hintText: 'Company Password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            setState(() {
              userData.companyPass = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsuranceForgotSection(),
                ),
              );
            },
            child: const Text(
              "Forgot your account?",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            signInCompany();
            saveUser("company");
            if (kDebugMode) {
              print(saveUser.toString());
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
          child: const Text('Sign In as Company'),
        ),
        const SizedBox(height: 10.0),
        EnterpriseQuickLoginStatus.quickLoginActivated == true
            ? const Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: kDarkRed,
                          height: 7.5,
                          thickness: 3,
                          indent: 0,
                          endIndent: 5,
                        ),
                      ),
                      Text("OR"),
                      Expanded(
                        child: Divider(
                          color: kPureBlue,
                          height: 7.5,
                          thickness: 3,
                          indent: 5,
                          endIndent: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                ],
              )
            : Container(),
        // Biometrics
        EnterpriseQuickLoginStatus.quickLoginActivated == true
            ? ElevatedButton(
                onPressed: () async {
                  // Trigger biometric authentication logic
                  bool authenticated = await showBiometricAuthenticationDialog(context);

                  if (authenticated) {
                    // Biometric authentication successful
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const EnterpriseNavBar()),
                      );
                    }
                  } else {
                    // Biometric authentication failed or canceled
                    if (kDebugMode) {
                      print("Biometric authentication failed or canceled.");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Biometrics Login'),
              )
            : Container(),

        compResult == "company"
            ? Container()
            : GestureDetector(
                onTap: () {
                  switchCompanyInputType();
                  if (kDebugMode) {
                    print("Switch to Insurance");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: vertical(10),
                  child: Text(
                    _useCompany ? 'Switch to Insurance' : 'Switch to Company',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

        const SizedBox(height: 10.0),

        compResult == "company"
            ? Container()
            :
            // Back to member button
            ElevatedButton(
                onPressed: () {
                  switchToMember();
                  if (kDebugMode) {
                    print("Switch to Member");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Back to Member'),
              ),
      ],
    );
  }

  Widget buildInsuranceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _companyEmailController,
          decoration: const InputDecoration(
            hintText: 'Insurance ID',
            prefixIcon: Icon(Icons.person_outline_rounded),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            setState(() {
              userData.insuranceEmail = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          controller: _insurancePassController,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            hintText: 'Insurance Password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            setState(() {
              userData.insurancePass = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsuranceForgotSection(),
                ),
              );
            },
            child: const Text(
              "Forgot your account?",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            // signInInsurance();

            signInInsuTemp();
            saveUser("insurance");
            if (kDebugMode) {
              print(saveUser.toString());
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Sign In as Insurance'),
        ),
        const SizedBox(height: 10.0),
        InsuranceQuickLoginStatus.quickLoginActivated == true
            ? const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: kDarkRed,
                    height: 7.5,
                    thickness: 3,
                    indent: 0,
                    endIndent: 5,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    color: kPureBlue,
                    height: 7.5,
                    thickness: 3,
                    indent: 5,
                    endIndent: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        )
            : Container(),

        // Biometrics
        InsuranceQuickLoginStatus.quickLoginActivated == true
            ? ElevatedButton(
                onPressed: () async {
                  // Trigger biometric authentication logic
                  bool authenticated = await showBiometricAuthenticationDialog(context);

                  if (authenticated) {
                    // Biometric authentication successful
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const InsuranceNavBar()),
                      );
                    }
                  } else {
                    // Biometric authentication failed or canceled
                    if (kDebugMode) {
                      print("Biometric authentication failed or canceled.");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Biometrics Login'),
              )
            : Container(),

        // Switch
        insurResult == "insurance"
            ? Container()
            : GestureDetector(
                onTap: () {
                  switchCompanyInputType();
                  if (kDebugMode) {
                    print("Switch to Company");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: vertical(10),
                  child: Text(
                    _useCompany ? 'Switch to Insurance' : 'Switch to Company',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
        const SizedBox(height: 10.0),

        insurResult == "insurance"
            ? Container()
            : ElevatedButton(
                onPressed: () {
                  switchToMember();
                  if (kDebugMode) {
                    print("Switch to Member");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Back to Member'),
              ),
      ],
    );
  }
}

class MemberIDInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formattedValue = '';

    // Allow only digits
    for (int i = 0; i < newValue.text.length; i++) {
      if (RegExp(r'\d').hasMatch(newValue.text[i])) {
        formattedValue += newValue.text[i];
      }
    }

    // Add hyphen automatically after 9 digits
    if (formattedValue.length > 9) {
      formattedValue = '${formattedValue.substring(0, 9)}-${formattedValue.substring(9, formattedValue.length)}';
    }

    // Ensure max length is 11
    if (formattedValue.length > 11) {
      formattedValue = formattedValue.substring(0, 11);
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
