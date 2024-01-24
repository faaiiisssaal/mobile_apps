import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helathcareapp/feature/auth/presentation/pages/user/badanusaha/member/member.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/badanusaha/profile/profile.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/badanusaha/data/data.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/user/badanusaha/home/home.dart';

class EnterpriseNavBar extends StatefulWidget {
  const EnterpriseNavBar({super.key});

  @override
  createState() => _EnterpriseNavBarState();
}

class _EnterpriseNavBarState extends State<EnterpriseNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const EnterpriseHomePage(),
    const EnterpriseDataPage(),
    const EnterprisePolicyPage(),
    const EnterpriseProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
