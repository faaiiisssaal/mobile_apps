import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../background/userdata.dart';

class NextScreen extends StatelessWidget {
  final UserData userData;

  NextScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputTypeWidget(),
          _buildUserDataWidgets(),
          // Add more widgets as needed
        ],
      ),
    );
  }

  Widget _buildInputTypeWidget() {
    String inputType = _determineInputType(userData);

    return Text('Input Type: $inputType');
  }

  Widget _buildUserDataWidgets() {
    if (userData.email.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: ${userData.email}'),
          Text('Password: ${userData.password}'),
        ],
      );
    } else if (userData.memberId.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Member ID: ${userData.memberId}'),
          Text('Date of Birth: ${_formatDate(userData.dateOfBirth)}'),
        ],
      );
    } else {
      return const SizedBox.shrink(); // Return an empty widget if no data
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-M-d').format(date);
  }

  String _determineInputType(UserData userData) {
    if (userData.email.isNotEmpty) {
      return 'Email';
    } else if (userData.memberId.isNotEmpty) {
      return 'Member ID';
    } else {
      return 'Unknown';
    }
  }
}
