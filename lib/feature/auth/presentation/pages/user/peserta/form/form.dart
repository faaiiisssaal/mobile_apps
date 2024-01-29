import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: topleftright(30, 30, 30),
              height: 50,
              child: const Text(
                  "FORM",
                style: TextStyle(
                  fontSize: 30
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView(
                padding: paddingall(10),
                children: [
                  const ListTile(
                    leading: Icon(Icons.stairs_outlined),
                    title: Text('Procedure Claim'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'asset/contact-form.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: const Text('Outpatient Claim Form'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'asset/contact-form.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: const Text('Inpatient Claim Form'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
