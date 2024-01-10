import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../background/userdata.dart';
import '../body/nextscreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _useEmailAndPassword = true;

  UserData userData = UserData(
    email: '',
    password: '',
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
        _dateController.text = DateFormat('MM/dd/yyyy').format(selectedDate);
      });
    }
  }

  void switchInputType() {
    setState(() {
      // Reset data based on the current input type
      if (_useEmailAndPassword) {
        // Reset Email/Password data
        _emailController.clear();
        _passwordController.clear();
        userData.email = '';
        userData.password = '';
      } else {
        // Reset Member ID/Date of Birth data
        _memberController.clear();
        _dateController.clear();
        userData.memberId = '';
        userData.dateOfBirth = DateTime.now();
      }

      // Switch input type
      _useEmailAndPassword = !_useEmailAndPassword;
    });
  }

  void signIn() {
    // Navigate to the next screen and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextScreen(userData: userData),
      ),
    );
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
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: screenHeight * 0.2,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'asset/smilynks.png',
                        filterQuality: FilterQuality.high,
                        width: screenHeight * 0.2,
                      ), // Replace with your logo
                    ),
                    SizedBox(height: screenHeight * 0.02), // 2% of screen height

                    // Single Row - ID Member and Date Birth
                    // Email and Password Section
                    if (_useEmailAndPassword)
                      buildEmailAndPasswordSection(),

                    // ID Member and Date Birth Section
                    if (!_useEmailAndPassword)
                      buildIDMemberAndDateBirthSection(),

                    SizedBox(height: screenHeight * 0.02), // 2% of screen height
                    // Switch between Email/Password and ID Member/Date Birth
                    GestureDetector(
                      onTap: () {
                        switchInputType();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          _useEmailAndPassword ? 'Switch to Member ID' : 'Switch to Email',
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5),
          child: Text(
            "Copyrights, ${DateTime.now().year} \u00a9 PT Abadi Smilynks. All rights reserved.",
            softWrap: true,
            style: const TextStyle(fontSize: 12.5),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildEmailAndPasswordSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          onChanged: (value) {
            setState(() {
              userData.email = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          controller: _passwordController,
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
          ),
          onChanged: (value) {
            setState(() {
              userData.password = value;
            });
          },
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            signIn();
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }

  Widget buildIDMemberAndDateBirthSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _memberController,
          decoration: const InputDecoration(
            hintText: 'ID Member',
            prefixIcon: Icon(Icons.person_outline_rounded),
          ),
          onChanged: (value) {
            setState(() {
              userData.memberId = value;
            });
          },
        ),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () async {
            _showCalendar(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: 'Date Birth',
                prefixIcon: Icon(Icons.date_range_outlined),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            signIn();
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }

  // String _formatDate(DateTime date) {
  //   return DateFormat('yyyy-M-d').format(date);
  // }

}
