import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';

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
                  ListTile(
                    leading: Image.asset(
                        'asset/contact-form.png',
                        width: 24.0,
                        height: 24.0,
                        color: Theme.of(context).brightness == Brightness.light ? kPureBlack : kPureWhite
                    ),
                    title: Text('Procedure Claim',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                        'asset/contact-form.png',
                        width: 24.0,
                        height: 24.0,
                        color: Theme.of(context).brightness == Brightness.light ? kPureBlack : kPureWhite
                    ),
                    title: Text('Outpatient Claim Form',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'asset/contact-form.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                    title: Text('Inpatient Claim Form',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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
