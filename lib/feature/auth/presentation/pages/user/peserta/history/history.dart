import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

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
                height: 160,
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
                            width: 100,
                            child: Text("Name"),
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
                                    value: "Ni Made Raysita Iswari Nuramanda Pande",
                                    child: Text("Ni Made Raysita Iswari Nuramanda Pande"),
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
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
                            width: 100,
                            child: Text("Effective Policy"),
                          ),
                          Container(
                            padding: onlyleft(5),
                            width: 5,
                            child: const Text(":"),
                          ),
                          Expanded(
                              child: Container(
                                padding: onlyleft(15),
                                  child: const Text("Jan 01 2024 to Dec 01 2024"))
                          )
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
