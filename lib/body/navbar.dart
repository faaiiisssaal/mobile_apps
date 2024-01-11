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
          body: _pages[_currentIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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
        )
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   final UserData userData;
//
//   const HomeScreen({super.key, required this.userData});
//
//   @override
//   Widget build(BuildContext context) {
//
//     int _currentIndex = 0;
//
//     final List<Widget> _pages = [
//       // Define your pages/widgets here
//       // Example: PageOne(),
//       //          PageTwo(),
//       //          PageThree(),
//     ];
//
//     return SafeArea(
//         child: Scaffold(
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _currentIndex,
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         )
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text('User Data'),
//   //     ),
//   //     body: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         _buildInputTypeWidget(),
//   //         _buildUserDataWidgets(),
//   //         // Add more widgets as needed
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // Widget _buildInputTypeWidget() {
//   //   String inputType = _determineInputType(userData);
//   //
//   //   return Text('Input Type: $inputType');
//   // }
//   //
//   // Widget _buildUserDataWidgets() {
//   //   if (userData.email.isNotEmpty) {
//   //     return Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Text('Email: ${userData.email}'),
//   //         Text('Password: ${userData.password}'),
//   //       ],
//   //     );
//   //   } else if (userData.memberId.isNotEmpty) {
//   //     return Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Text('Member ID: ${userData.memberId}'),
//   //         Text('Date of Birth: ${_formatDate(userData.dateOfBirth)}'),
//   //       ],
//   //     );
//   //   } else {
//   //     return const SizedBox.shrink(); // Return an empty widget if no data
//   //   }
//   // }
//   //
//   // String _formatDate(DateTime date) {
//   //   return DateFormat('yyyy-M-d').format(date);
//   // }
//   //
//   // String _determineInputType(UserData userData) {
//   //   if (userData.email.isNotEmpty) {
//   //     return 'Email';
//   //   } else if (userData.memberId.isNotEmpty) {
//   //     return 'Member ID';
//   //   } else {
//   //     return 'Unknown';
//   //   }
//   // }
// }
