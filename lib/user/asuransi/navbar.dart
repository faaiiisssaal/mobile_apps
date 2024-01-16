import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/user/asuransi/profile.dart';
import 'package:helathcareapp/user/asuransi/data.dart';
import 'package:helathcareapp/user/asuransi/home.dart';


class InsuranceNavBar extends StatefulWidget {
  const InsuranceNavBar({super.key});

  @override
  createState() => _InsuranceNavBarState();
}

class _InsuranceNavBarState extends State<InsuranceNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const InsuranceHomePage(),
    const InsuranceDataPage(),
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
            iconSize: 36,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.raleway(),
            selectedFontSize: 14,
            selectedItemColor: Colors.white,
            unselectedLabelStyle: GoogleFonts.raleway(),
            unselectedFontSize: 14,
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
                icon: Icon(Icons.qr_code_2_outlined,
                ),
                label: 'Data',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
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

