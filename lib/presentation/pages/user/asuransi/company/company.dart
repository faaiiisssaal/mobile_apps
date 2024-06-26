import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';

class InsuranceCompanyPage extends StatefulWidget {
  const InsuranceCompanyPage({super.key});

  @override
  State<InsuranceCompanyPage> createState() => _InsuranceCompanyPageState();
}

class _InsuranceCompanyPageState extends State<InsuranceCompanyPage> {

  String dropDownValue1 = "LALA";
  String dropDownValue2 = "2352352366261116";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Placeholder(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                padding: paddingall(10),
                height: 75,
                decoration: const BoxDecoration(
                  color: kSkyBlue,
                  borderRadius: r15,
                ),
                margin: topleftright(10, 10, 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 110,
                            child: Text("Company Name"),
                          ),
                          Container(
                            padding: onlyleft(5),
                            width: 5,
                            child: const Text(":"),
                          ),
                          Expanded(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  padding: paddingall(0),
                                  isExpanded: true,
                                  value: dropDownValue1,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownValue1 = newValue!;
                                    });
                                  },
                                  items: const [
                                    DropdownMenuItem<String>(
                                      value: "LALA",
                                      child: Text(
                                        "LALA",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "LILI",
                                      child: Text("LILI"),
                                    ),
                                    DropdownMenuItem(
                                      value: "LULU",
                                      child: Text("LULU"),
                                    ),
                                    DropdownMenuItem(
                                      value: "LELE",
                                      child: Text("LELE"),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              hp10, // constant value from constant.dart
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: bottomleftright(10, 10, 10),
                  child: const Center(
                    child: Text("No Data"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
