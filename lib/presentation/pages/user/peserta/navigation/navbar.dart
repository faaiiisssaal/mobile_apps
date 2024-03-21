import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/form/form.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/history/history.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/home/home.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/profile/profile.dart';
import 'package:helathcareapp/presentation/pages/user/peserta/qr/qrcode.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  createState() => _NavBarState();
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

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kPureWhite,
          contentPadding: paddingall(20),
          actionsPadding: paddingall(10),
          // title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerRight,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerRight,
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
                    Icons.my_library_books_rounded,
                  ),
                  label: 'Form',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_2_outlined,
                  ),
                  label: 'QR Code',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: 'History',
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
