// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';

import '../presentation/widgets/hotline.dart';
import '../presentation/widgets/information.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: true,
            shadowColor: kPureWhite,
            backgroundColor: kPureWhite,
            foregroundColor: kPureWhite,
            surfaceTintColor: kPureWhite,
            title: Text(
              "Selamat Pagi, Linda",
              style: TextStyle(fontSize: mediawidth(0.045, context), fontWeight: FontWeight.bold, color: kPureBlack),
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Terdaftar di Asuransi Arta Graha General Insurance",
                style: TextStyle(fontSize: mediawidth(0.045, context), fontWeight: FontWeight.bold, color: kPureBlack),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SingleChildScrollView(
                    padding: paddingall(10),
                    child: Column(
                      children: [

                        // 1st row for username
                        // Container(
                        //   width: double.infinity,
                        //   padding: paddingall(10),
                        //   decoration: const BoxDecoration(
                        //     color: kPureWhite, // Moved the color property to BoxDecoration
                        //     borderRadius: r20, // Adjust the radius as needed
                        //     // You can also add border, shadow etc. here
                        //   ),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "PAGI\nLinda",
                        //         style: TextStyle(fontSize: mediawidth(0.045, context), fontWeight: FontWeight.bold),
                        //       ),
                        //       hp10,
                        //       Text(
                        //         // "Terdaftar sebagai Administration Service Only (ASO)",
                        //         "terdaftar di karyawan PT Pacific Place Jakarta",
                        //         style: TextStyle(fontSize: mediawidth(0.035, context), fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // hp10,

                        // 2nd row for Information
                        Container(
                          child: ImageSlideShow().build(context),
                        ),
                        hp10,

                        // 3rd row for nearby
                        Container(
                          width: mediawidth(1, context),
                          padding: paddingall(10),
                          decoration: const BoxDecoration(
                            color: kPureWhite, // Moved the color property to BoxDecoration
                            borderRadius: r20, // Adjust the radius as needed
                            // You can also add border, shadow etc. here
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "asset/placeholder.png",
                                height: mediawidth(0.085, context),
                                width: mediawidth(0.085, context),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nearby ...",
                                      style: TextStyle(fontSize: mediawidth(0.05, context), fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "RUMAH SAKIT DR. CIPTO MANGUKUSUMO",
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(fontSize: mediawidth(0.025, context), fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        hp10,
                        Container(
                            height: mediaheight(0.36, context),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: kPureWhite, // Moved the color property to BoxDecoration
                              borderRadius: r20, // Adjust the radius as needed
                              // You can also add border, shadow etc. here
                            ),
                            child: Column(
                              children: [
                                // 1st choice member name
                                Container(
                                  padding: horiverti(10, 5),
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
                                            SizedBox(
                                              width: 90,
                                              child: Text(
                                                "Member Name",
                                                style: TextStyle(
                                                  fontSize: mediawidth(0.025, context),
                                                ),
                                              ),
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
                                                    // value: dropDownValue1,
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        // dropDownValue1 = newValue!;
                                                      });
                                                    },
                                                    items: [
                                                      DropdownMenuItem<String>(
                                                        value: "LALA",
                                                        child: Text(
                                                          "LALA",
                                                          style: TextStyle(
                                                            fontSize: mediawidth(0.025, context),
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "LILI",
                                                        child: Text(
                                                          "LILI",
                                                          style: TextStyle(
                                                            fontSize: mediawidth(0.025, context),
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "LULU",
                                                        child: Text(
                                                          "LULU",
                                                          style: TextStyle(
                                                            fontSize: mediawidth(0.025, context),
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "LELE",
                                                        child: Text(
                                                          "LELE",
                                                          style: TextStyle(
                                                            fontSize: mediawidth(0.025, context),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                hp10,

                                Container(
                                  padding: paddingall(10),
                                  child: ButtonTheme(
                                    buttonColor: kSeaBlue,
                                    textTheme: ButtonTextTheme.primary,
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      padding: paddingall(0),
                                      isExpanded: true,
                                      // value: dropDownValue3,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          // dropDownValue3 = newValue!;
                                        });
                                      },
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: "Rawat Jalan",
                                          child: Text(
                                            "Rawat Jalan",
                                            style: TextStyle(
                                              fontSize: mediawidth(0.025, context),
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Rawat Inap",
                                          child: Text(
                                            "Rawat Inap",
                                            style: TextStyle(
                                              fontSize: mediawidth(0.025, context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // constant value from constant.dart
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
                            )),
                        hp10,
                        Container(
                          width: double.infinity,
                          padding: paddingall(10),
                          decoration: const BoxDecoration(
                            color: kPureWhite, // Moved the color property to BoxDecoration
                            borderRadius: r20, // Adjust the radius as needed
                            // You can also add border, shadow etc. here
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hotline 24/7",
                                style: TextStyle(
                                  fontSize: mediawidth(0.085, context),
                                ),
                              ),
                              hp10,
                              const HotlineWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              childCount: 1
            ),)
        ],
      )
    );
  }
}