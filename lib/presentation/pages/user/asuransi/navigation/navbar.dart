import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/company/company.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/home/home.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/member/member.dart';
import 'package:healthcareapp/presentation/pages/user/asuransi/profile/profile.dart';
class InsuranceNavBar extends StatefulWidget {
  const InsuranceNavBar({super.key});

  @override
  createState() => _InsuranceNavBarState();
}

class _InsuranceNavBarState extends State<InsuranceNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const InsuranceHomePage(),
    const InsuranceCompanyPage(),
    const InsuranceMemberPage(),
    const InsuranceProfilePage(),
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
                label: 'Company',
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
