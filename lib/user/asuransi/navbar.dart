import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/user/peserta/history.dart';
import 'package:helathcareapp/user/peserta/home.dart';
import 'package:helathcareapp/user/peserta/profile.dart';
import 'package:helathcareapp/user/peserta/feature.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FeaturePage(),
    // const QRViewExample(),
    const HistoryPage(),
    const ProfilePage(),
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
                backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                ),
                label: 'Feature',
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

