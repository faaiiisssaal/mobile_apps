// ignore_for_file: unused_field, unused_element

import 'package:healthcareapp/common/constant.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcareapp/presentation/pages/gatepass/forgot%20_member.dart';
import 'package:healthcareapp/presentation/pages/gatepass/forgot_insurance.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/navigation/navbar.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/navigation/navbar.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/navigation/navbar.dart';
import 'package:healthcareapp/presentation/widgets/biometrics.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_sources/remote_data_source.dart';
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
        _memberdateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
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

  // void signInMemTemp() {
  //   // Navigate to the next screen and pass userData
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const NavBar(),
  //     ),
  //   );
  // }

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

  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _keyform.currentState!.validate();
    });
  }

  Map<String?, dynamic> datalogin = {};

  void saveDataloginuser(
      String companyName,
      String clientID,
      String policyNo,
      String cardNo,
      String empID,
      String memberID,
      String memberName,
      String classNo,
      String memberSex,
      String memberPlan,
      String memberBirthDate,
      String effectiveDate,
      String ipDetail,
      String opDetail,
      ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("companyName", companyName);
    pref.setString("clientID", clientID);
    pref.setString("policyNo", policyNo);
    pref.setString("cardNo", cardNo);
    pref.setString("empID", empID);
    pref.setString("memberID", memberID);
    pref.setString("memberName", memberName);
    pref.setString("classNo", classNo);
    pref.setString("memberSex", memberSex);
    pref.setString("memberPlan", memberPlan);
    pref.setString("memberBirthDate", memberBirthDate);
    pref.setString("effectiveDate", effectiveDate);
    pref.setString("ipDetail", ipDetail);
    pref.setString("opDetail", opDetail);
    setState(() {
      policyNo = policyNo;
    });
  }

  RemoteDataSource remoteDataSource = RemoteDataSourceImpl(client: http.Client());

  void signIn(BuildContext context) {
    final String memberId = _membermemberController.text;
    final String doB = _memberdateController.text;

    // Verify against fake data
    if (memberId.isNotEmpty && doB.isNotEmpty) {
      datalogin = {
        "memberno": memberId,
        "bdate": doB,
      };
      if (kDebugMode) {
        print(doB);
        print(memberId);
      }
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      remoteDataSource.postLoginUser(datalogin).then((value) {
        if (value.isNotEmpty) {
          // Save data and navigate to another page upon successful login
          for (int i = 0; i < value.length; i++) {
            saveDataloginuser(
              value[i].companyName.toString(),
              value[i].clientID.toString(),
              value[i].policyNo.toString(),
              value[i].cardNo.toString(),
              value[i].empID.toString(),
              value[i].memberID.toString(),
              value[i].memberName.toString(),
              value[i].classNo.toString(),
              value[i].memberSex.toString(),
              value[i].memberPlan.toString(),
              value[i].memberBirthDate.toString(),
              value[i].effectiveDate.toString(),
              value[i].ipDetail.toString(),
              value[i].opDetail.toString(),
            );
          }

          // Navigate to another page after a delay
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavBar()),
            );
          });

          if (kDebugMode) {
            print("Member Login Successful");
          }
        } else {
          // No data found for the provided credentials
          _showFloatingSnackbar('No data found for the provided credentials');
          Navigator.pop(context); // Dismiss the dialog
        }
      }).catchError((error) {
        // Handle errors from postLoginUser
        if (kDebugMode) {
          print("Error during login: $error");
        }
        _showFloatingSnackbar('Error during login');
        Navigator.pop(context); // Dismiss the dialog
      });

      _membermemberController.clear();
      _memberdateController.clear();
    } else {
      // Display an error message
      if (kDebugMode) {
        print("Member Login Error: Invalid Member ID or Date of Birth");
      }
      _showFloatingSnackbar('Invalid Member ID or Date of Birth');
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

  final _keyform = GlobalKey<FormState>();
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
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: vertical(5),
              width: double.infinity,
              child: Text(
                "Copyrights, ${DateTime.now().year} \u00a9 PT Abadi Smilynks. All rights reserved.",
                style: Theme.of(context).textTheme.labelMedium,
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
    );
  }

  Widget buildMemberSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Member ID
        TextFormField(
          controller: _membermemberController,
          decoration: InputDecoration(
            hintText: 'Member ID',
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: const Icon(Icons.person_outline_rounded),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
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
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                hintStyle: Theme.of(context).textTheme.labelLarge,
                prefixIcon: const Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
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
            if (_membermemberController.text.isEmpty || _memberdateController.text.isEmpty) {
              _showFloatingSnackbar('Please fill in the form');
            } else {
              signIn(context);
            }
            // signInMemTemp();
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
                    if (mounted) {
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
                    if (mounted) {
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
                    if (mounted) {
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
