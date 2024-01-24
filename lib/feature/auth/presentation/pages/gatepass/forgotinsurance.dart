import 'package:flutter/material.dart';

import 'package:helathcareapp/feature/common/constant.dart';

class InsuranceForgotSection extends StatefulWidget {
  const InsuranceForgotSection({super.key});

  @override
  State<InsuranceForgotSection> createState() => _InsuranceForgotSectionState();
}

class _InsuranceForgotSectionState extends State<InsuranceForgotSection> {

  final TextEditingController _insuranceforgotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: paddingall(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaheight(0.2, context),
                  ),
                  const SizedBox(
                      child: Text(
                        "Recovery\nAccount",
                        style: TextStyle(fontSize: 36),
                      )),
                  c10,
                  SizedBox(
                      height: mediaheight(0.05, context),
                      child: const Text("Enter your ID for verifying your account")),
                  TextFormField(
                    controller: _insuranceforgotController,
                    decoration: const InputDecoration(
                      hintText: 'Your ID',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10.0),
                  c10,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Send"),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
