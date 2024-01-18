import 'package:flutter/material.dart';

import '../../../constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  String dropDownValue = "LALA";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Placeholder(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text("Name"),
                        ),
                        Expanded(
                          child: DropdownButton<String>(

                            value: dropDownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: "LALA",
                                  child: Text("LALA"),
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
                              DropdownMenuItem(
                                value: "OLOH",
                                child: Text("OLOH"),
                              ),
                            ],
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
              c10, // constant value from constant.dart
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
