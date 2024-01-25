import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class InsuranceMemberPage extends StatefulWidget {
  const InsuranceMemberPage({super.key});

  @override
  State<InsuranceMemberPage> createState() => _InsuranceMemberPageState();
}

class _InsuranceMemberPageState extends State<InsuranceMemberPage> {

  String dropDownValue1 = "PT ABAJA";
  String dropDownValue2 = "2352352366261116";
  String dropDownValue3 = "LALA";

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
                height: 200,
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
                                      value: "PT ABAJA",
                                      child: Text(
                                        "PT ABAJA",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "PT HBJ",
                                      child: Text("PT HBJ"),
                                    ),
                                    DropdownMenuItem(
                                      value: "PT PPJ",
                                      child: Text("PT PPJ"),
                                    ),
                                    DropdownMenuItem(
                                      value: "PT NUSAPALA",
                                      child: Text("PT NUSAPALA"),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 110,
                            child: Text("Policy No"),
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
                                  value: dropDownValue2,
                                  onChanged: (String? newValue2) {
                                    setState(() {
                                      dropDownValue2 = newValue2!;
                                    });
                                  },
                                  items: const [
                                    DropdownMenuItem<String>(
                                      value: "2352352366261116",
                                      child: Text("2352352366261116"),
                                    ),
                                    DropdownMenuItem(
                                      value: "2352352366260000",
                                      child: Text("2352352366260000"),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                      hp10,
                      Row(
                        children: [
                          const SizedBox(
                            width: 110,
                            child: Text("Member Name"),
                          ),
                          Container(
                            padding: onlyleft(5),
                            width: 5,
                            child: const Text(":"),
                          ),
                          Expanded(
                            child: Padding(

                              padding: horizontal(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding:paddingall(10),
                                  hintText: 'Member Name',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      )
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
                  margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
