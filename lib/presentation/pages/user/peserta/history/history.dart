import 'package:flutter/material.dart';
import 'package:healthcareapp/common/constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  String? dropDownValue1;
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
                height: 200,
                decoration: const BoxDecoration(
                  color: kSkyBlue,
                  borderRadius: r10,
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
                            width: 100,
                            child: Text("Name",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color, // Use current text color
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
            ],
          ),
        ),
      ),
    );
  }

  // BlocBuilder<FamilyUserCubit, FamilyUserState> buildBlocBuilderMenuCategory() {
  //   return BlocBuilder<FamilyUserCubit, FamilyUserState>(
  //     builder: (context, state) {
  //       if (state is FamilyUserLoadingState) {
  //         if (kDebugMode) {
  //           print('API Family User are Loading $state');
  //         }
  //         return const Center(child: SizedBox(height: 15, width: 15, child: CircularProgressIndicator()));
  //       } else if (state is FamilyUserLoadedState) {
  //         if (kDebugMode) {
  //           print('API Family User are Loaded: $state');
  //         }
  //         return DropdownButton<String>(
  //           isExpanded: true,
  //           hint: const Text("Pilih Member"),
  //           value: dropDownValue1,
  //           onChanged: (value) {
  //             setState(() {
  //               dropDownValue1 = value;
  //               databenefit = {"memberno": "$value", "plan": "%%"};
  //               Future.microtask(
  //                     () => context.read<BenefitUserCubit>().post(databenefit),
  //               );
  //             });
  //             if (kDebugMode) {
  //               print(value);
  //             }
  //           },
  //           items: state.items.map((card) {
  //             return DropdownMenuItem<String>(
  //               value: card.memberno,
  //               child: Text(card.name ?? ''),
  //             );
  //           }).toList(),
  //         );
  //       } else if (state is FamilyUserErrorState) {
  //         return Center(
  //           key: const Key('error_message'),
  //           child: Text(
  //             state.message,
  //             style: const TextStyle(color: kPureBlack),
  //           ),
  //         );
  //       } else {
  //         return const Center(
  //           key: Key('error_message'),
  //           child: Text(
  //             'error',
  //             style: TextStyle(color: kPureBlack),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }
}
