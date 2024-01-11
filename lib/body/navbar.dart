import 'package:flutter/material.dart';
import 'package:helathcareapp/body/history.dart';
import 'package:helathcareapp/body/home.dart';
import 'package:helathcareapp/body/profile.dart';
import 'package:helathcareapp/body/qrcode.dart';
import 'feature.dart';

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
    const QRCodePage(),
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
            splashColor: Colors.white,
            highlightColor: Colors.white,
          ),
          child: BottomNavigationBar(
            fixedColor: Colors.blueAccent,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Feature',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_2_outlined),
                label: 'QR Code',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

