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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPureWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: paddingall(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("InPayment Claim"),
                                        hp10,
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Medical Visit Date"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("31 Jan 2024")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Medical Place"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("Budi Asih Hosiptal")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Total Payment"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("Rp. 12.345.678")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Total Paid"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("Rp. 13.000.000")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Un-Paid"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("0")),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 125,
                                              child: Text("Doctor In Charge"),
                                            ),
                                            wp10,
                                            Text(":"),
                                            wp10,
                                            Expanded(child: Text("Dokter Mariana")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              hp10,
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("More"),
                                ),
                              )
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
                                              width: 125,
                                              child: Text("Medical Visit Date"),
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
                                              width: 125,
                                              child: Text("Medical Place"),
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
                                              width: 125,
                                              child: Text("Total Payment"),
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
                                              width: 125,
                                              child: Text("Total Paid"),
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
                                              width: 125,
                                              child: Text("Medical Visit Date"),
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
                                              width: 125,
                                              child: Text("Medical Place"),
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
                                              width: 125,
                                              child: Text("Total Payment"),
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
                                              width: 125,
                                              child: Text("Total Paid"),
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
                                              width: 125,
                                              child: Text("Medical Visit Date"),
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
                                              width: 125,
                                              child: Text("Medical Place"),
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
                                              width: 125,
                                              child: Text("Total Payment"),
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
                                              width: 125,
                                              child: Text("Total Paid"),
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
                                              width: 125,
                                              child: Text("Medical Visit Date"),
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
                                              width: 125,
                                              child: Text("Medical Place"),
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
                                              width: 125,
                                              child: Text("Total Payment"),
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
                                              width: 125,
                                              child: Text("Total Paid"),
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
