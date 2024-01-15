import 'package:flutter/foundation.dart';
import 'package:helathcareapp/user/perusahaan/navbar.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../background/userdata.dart';
import 'asuransi/navbar.dart';
import 'peserta/navbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = false;
  final TextEditingController _insuranceEmailController = TextEditingController();
  final TextEditingController _insurancePassController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPassController = TextEditingController();
  final TextEditingController _clientmemberController = TextEditingController();
  final TextEditingController _clientdateController = TextEditingController();
  bool _useCompany = true;
  bool _useInsurance = true;
  bool _useClient = true;

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
        _clientdateController.text = DateFormat('yyyy-M-dd').format(selectedDate);
      });
    }
  }

  void switchInputType() {
    setState(() {
      if (_useClient) {
        // Reset data based on the current input type (Client)
        _clientmemberController.clear();
        _clientdateController.clear();
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
      _useClient = !_useClient;
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

  void switchToClient() {
    setState(() {
      _useClient = true;
      _useCompany = false;
      _useInsurance = false;
    });
  }

  void signIn() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavBar(),
      ),
    );
  }

  void signInInsurance() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InsuranceNavBar(),
      ),
    );
  }

  void signInCompany() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CompanyNavBar(),
      ),
    );
  }

  String _appVersion = "Unknown"; // Default value

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    buildClientSection(); // Call this method to get the app version during initialization
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        statusBarColor: Colors.white, // Set your app's background color
        statusBarIconBrightness: Brightness.dark, // Adjust icon color for contrast
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // 1st Row "Logo" Position
                    Container(
                        height: screenHeight * 0.2,
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
                        )
                    ),

                    SizedBox(
                      height: screenHeight * 0.1,
                    ), // 2% of screen height

                    // 2nd Row - 3 Different Form with Switchable in Single Row

                    if (_useClient) ...[
                      buildClientSection(),
                    ],
                    if (!_useClient) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!_useClient && !_useCompany) ...[
                            buildInsuranceSection(),
                          ],
                          if (_useCompany) ...[
                            buildCompanySection(),
                          ],
                        ],
                      ),
                    ],

                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    // 2% of screen height
                  ],
                ),
              ),
            ),
          ],
        ),


        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Copyrights, ${DateTime.now().year} \u00a9 PT Abadi Smilynks. All rights reserved.",
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4.0),
              Text(
                'App Version: $_appVersion',
                style: const TextStyle(fontSize: 12.5, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClientSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Client ID
        TextFormField(
          controller: _clientmemberController,
          decoration: const InputDecoration(
            hintText: 'Member No.',
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
            _MemberIdInputFormatter(),
          ],
          onChanged: (value) {
            setState(() {
              userData.memberId = value;
            });
          },
        ),
        const SizedBox(height: 10.0),

        // Client DoB
        GestureDetector(
          onTap: () async {
            _showCalendar(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _clientdateController,
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
        const SizedBox(height: 30.0),

        // Sign In Button
        ElevatedButton(
          onPressed: () {
            signIn();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
          child: const Text('Sign In As Client'),
        ),
        const SizedBox(height: 10.0),

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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              _useClient ? 'Switch to Insurance' : 'Switch to Client',
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
            hintText: 'ID',
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
            hintText: 'Password',
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
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            signInCompany();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
          child: const Text('Sign In As Company'),
        ),
        const SizedBox(height: 10.0),

        GestureDetector(
          onTap: () {
            switchCompanyInputType();
            if (kDebugMode) {
              print("Switch to Insurance");
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              _useCompany ? 'Switch to Insurance' : 'Switch to Company',
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10.0),
        // Back to Client button
        ElevatedButton(
          onPressed: () {
            switchToClient();
            if (kDebugMode) {
              print("Switch to Client");
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Back to Client'),
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
            hintText: 'ID',
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
            hintText: 'Password',
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
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            signInInsurance();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Sign In As Insurance'),
        ),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () {
            switchCompanyInputType();
            if (kDebugMode) {
              print("Switch to Company");
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              _useCompany ? 'Switch to Insurance' : 'Switch to Company',
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            switchToClient();
            if (kDebugMode) {
              print("Switch to Client");
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Back to Client'),
        ),
      ],
    );
  }
}

class _MemberIdInputFormatter extends TextInputFormatter {
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
      formattedValue =
          '${formattedValue.substring(0, 9)}-${formattedValue.substring(9, formattedValue.length)}';
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
