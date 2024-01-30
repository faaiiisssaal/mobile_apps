import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class EnterpriseMemberPage extends StatefulWidget {
  const EnterpriseMemberPage({super.key});

  @override
  State<EnterpriseMemberPage> createState() => _EnterpriseMemberPageState();
}

class _EnterpriseMemberPageState extends State<EnterpriseMemberPage> {

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
              hp10,
              // constant value from constant.dart

              // Expanded, Container, SingleChildScrollView, Column, Container, Column, Row
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: bottomleftright(10, 10, 10),
                  padding: paddingall(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                    
                          decoration: const BoxDecoration(
                            color: kPureWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 25,
                                    alignment: Alignment.topLeft,
                                    child: const Text("1"),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("MARUGAME UDON"),
                                        Row(
                                          children: [
                                            SizedBox(
                                                child: Text("Member No. "),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("21214415465"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Age"),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("99"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Effective Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("01 January 2024 to 31 December 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Plan"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("II"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        hp10,
                        Container(
                    
                          decoration: const BoxDecoration(
                            color: kPureWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 25,
                                    alignment: Alignment.topLeft,
                                    child: const Text("1"),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("MARUGAME UDON"),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Member No. "),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("21214415465"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Age"),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("99"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Effective Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("01 January 2024 to 31 December 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Plan"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("II"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        hp10,
                        Container(
                    
                          decoration: const BoxDecoration(
                            color: kPureWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 25,
                                    alignment: Alignment.topLeft,
                                    child: const Text("1"),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("MARUGAME UDON"),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Member No. "),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("21214415465"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Age"),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("99"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Effective Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("01 January 2024 to 31 December 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Plan"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("II"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        hp10,
                        Container(
                    
                          decoration: const BoxDecoration(
                            color: kPureWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 25,
                                    alignment: Alignment.topLeft,
                                    child: const Text("1"),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("MARUGAME UDON"),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Member No. "),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("21214415465"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Age"),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("99"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Effective Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("01 January 2024 to 31 December 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Plan"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("II"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        hp10,
                        Container(
                    
                          decoration: const BoxDecoration(
                            color: kPureWhite,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 25,
                                    alignment: Alignment.topLeft,
                                    child: const Text("1"),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("MARUGAME UDON"),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Member No. "),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("21214415465"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Text("Age"),
                                              width: 100,
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("99"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Effective Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("01 January 2024 to 31 December 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text("Plan"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Text("II"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
