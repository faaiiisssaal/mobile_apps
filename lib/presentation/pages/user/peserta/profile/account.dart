import 'package:flutter/material.dart';
import 'package:helathcareapp/common/constant.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: paddingall(15),
          height: 960,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Hero(
                tag: 'profileHero',
                child: CircleAvatar(
                  radius: 75,
                  // Add your profile picture here
                  backgroundImage: AssetImage('asset/alarm.png'),
                ),
              ),
              const Spacer(),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Faisal Setiadi',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'ID',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '6100123456',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Family No.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '1',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Policy No.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '235236373462362',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '03 September 1996',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Effective Plan',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '01 Januari 2024 to 31 Desember 2024',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Plan Status',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.05-20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'II',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget build2(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       body: SizedBox(
  //         width: double.infinity,
  //         child: SingleChildScrollView(
  //           padding: paddingall(15),
  //           child: const Column(
  //             children: [
  //               Hero(
  //                 tag: 'profileHero',
  //                 child: CircleAvatar(
  //                   radius: 75.0,
  //                   // Add your profile picture here
  //                   backgroundImage: AssetImage('asset/alarm.png'),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Name',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       'Faisal Setiadi',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'ID',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       '6100123456',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'Family No.',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       '1',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'Policy No.',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       '235236373462362',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'Date of Birth',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       '03 September 1996',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'Effective Plan',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       '01 Januari 2024 to 31 Desember 2024',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //
  //                     Text(
  //                       'Plan Status',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.05-20,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8.0),
  //                     Text(
  //                       'II',
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.height *0.02,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
