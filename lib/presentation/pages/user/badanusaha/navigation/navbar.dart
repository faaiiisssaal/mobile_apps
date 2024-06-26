import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/member/member.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/policy/policy.dart';
import 'package:healthcareapp/presentation/pages/user/badanusaha/profile/profile.dart';


class EnterpriseNavBar extends StatefulWidget {
  const EnterpriseNavBar({super.key});

  @override
  createState() => _EnterpriseNavBarState();
}

class _EnterpriseNavBarState extends State<EnterpriseNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const EnterpriseHomePage(),
    const EnterprisePolicyPage(),
    const EnterpriseMemberPage(),
    const EnterpriseProfilePage(),
  ];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height -
                kBottomNavigationBarHeight -
                MediaQuery.of(context).padding.bottom,
            child: Column(
              children: [
                Expanded(
                  child: _pages[_currentIndex],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.blue,
              iconSize: 24,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.lato(),
              selectedFontSize: 12,
              selectedItemColor: Colors.white,
              unselectedLabelStyle: GoogleFonts.lato(),
              unselectedFontSize: 12,
              unselectedItemColor: Colors.black,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.policy_outlined,
                  ),
                  label: 'Policy',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people_outlined,
                  ),
                  label: 'Member',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
