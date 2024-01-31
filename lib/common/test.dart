// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Center(
      child: Text(
        height.toString()
      ),
    );
  }
}
