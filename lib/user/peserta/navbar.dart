import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/user/peserta/history.dart';
import 'package:helathcareapp/user/peserta/home.dart';
import 'package:helathcareapp/user/peserta/profile.dart';
import 'package:helathcareapp/user/peserta/qrcode.dart';
import 'feature.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FeaturePage(),
    const ClientQRCode(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _pages[_currentIndex],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white, // start color
                Colors.blue,
                Colors.white, // middle color (white)
                Colors.blue,
                Colors.white, // end color
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0], // adjust stops accordingly
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
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
                  icon: Icon(
                    Icons.library_books,
                  ),
                  label: 'Form',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_2_outlined,
                  ),
                  label: 'QR Code',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history,
                  ),
                  label: 'History',
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
      ),
    );
  }
}
