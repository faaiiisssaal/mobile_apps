import 'package:flutter/material.dart';

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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                children: [
                  const ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Procedure Claim'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'asset/contact-form.png',
                      // Set the width and height of the image
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: const Text('Outpatient Claim Form'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Inpatient Claim Form'),
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
