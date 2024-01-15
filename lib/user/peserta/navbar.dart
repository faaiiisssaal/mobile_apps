import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/user/peserta/history/history.dart';
import 'package:helathcareapp/user/peserta/home/home.dart';
import 'package:helathcareapp/user/peserta/profile/profile.dart';
import 'package:helathcareapp/user/peserta/qr/qrcode.dart';
import 'form/form.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FormPage(),
    const QRViewExample(),
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
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF33BFFF),
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.raleway(),
            selectedFontSize: 12,
            selectedItemColor: Colors.white,
            unselectedLabelStyle: GoogleFonts.raleway(),
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
    );
  }
}
