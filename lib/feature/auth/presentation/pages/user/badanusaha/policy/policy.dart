import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/common/constant.dart';

class EnterprisePolicyPage extends StatefulWidget {
  const EnterprisePolicyPage({super.key});

  @override
  State<EnterprisePolicyPage> createState() => _EnterprisePolicyPageState();
}

class _EnterprisePolicyPageState extends State<EnterprisePolicyPage> {
  String dropDownValue1 = "LALA";
  String dropDownValue2 = "2352352366261116";
  String selectedOption = "46546545"; // Default selected option

  final Map<String, Map<String, String>> optionsData = {
    "46546545": {
      "Policy Name": "ArtaGraha General Insurance",
      "Effective Policy": "...",
      "Active Member": "500",
      "Plan": "II",
      "TC": "...",
      "Fee Policy": "Rp. 20.000.000,00",
    },
    "46546000": {
      "Policy Name": "Allianz Insurance",
      "Effective Policy": "Value for B - Option 1",
      "Active Member": "500",
      "Plan": "I",
      "TC": "...",
      "Fee Policy": "Rp. 50.000.000,00",
    },
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Placeholder(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: paddingall(10),
                  height: 75,
                  decoration: const BoxDecoration(
                    color: kPureWhite,
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
                                    value: selectedOption,
                                    items: optionsData.keys.map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedOption = newValue!;
                                      });
                                    },
                                  ),
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                hp10,
                Container(
                  margin: horizontal(10),
                  decoration: const BoxDecoration(
                    color: kPureWhite,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: paddingall(10),
                        decoration: const BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: optionsData[selectedOption]!.entries.map((entry) {
                            return ListTile(
                              title: Row(
                                children: [
                                  SizedBox(
                                      width: 90,
                                      child: Text(
                                        entry.key,
                                        softWrap: true,
                                        maxLines: 2,
                                      )
                                  ),
                                  const Text(": "),
                                  Expanded(
                                    child: Text(
                                      entry.value,
                                      softWrap: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),),
                      ),
                    ],
                  ),
                ),// constant value from constant.dart

              ],
            ),
          ),
        ),
      ),
    );
  }
}
