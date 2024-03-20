import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/cubit/user_benefit_cubit.dart';
import 'package:helathcareapp/presentation/cubit/user_family_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BenefitPage extends StatefulWidget {
  const BenefitPage({super.key});

  @override
  State<BenefitPage> createState() => _BenefitPageState();
}

class _BenefitPageState extends State<BenefitPage> {

  ScrollController scrollController = ScrollController();
  String dropDownValue1 = "LALA";

  String? memberNo;
  Map<String?, dynamic> databenefit = {};
  void loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    memberNo = pref.getString("memberID");
    if (kDebugMode) {
      print(memberNo);
    }
    databenefit = {
      "memberno": "$memberNo",
      "plan": "%%"
    };
    Future.microtask(
          () => context.read<BenefitUserCubit>().post(databenefit),
    );
  }

  String? memberID;
  Map<String?, dynamic> datafamily = {};
  void loadDataFamily() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    memberNo = pref.getString("empID");
    if (kDebugMode) {
      print(memberNo);
    }
    datafamily = {
      "empid": "$memberNo",
    };
    Future.microtask(
          () => context.read<FamilyUserCubit>().post(datafamily),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadDataFamily();
  }

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
                            child: Text("Member Name"),
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
              hp10,
              Expanded(child: buildBlocBuilderMenuCategory()),
              hp10,
              // constant value from constant.dart
              Expanded(
                child: buildDataProvider(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<FamilyUserCubit, FamilyUserState> buildBlocBuilderMenuCategory() {
    return BlocBuilder<FamilyUserCubit, FamilyUserState>(
      builder: (context, state) {
        if (state is FamilyUserLoadingState) {
          if (kDebugMode) {
            print('API Family User are Loading $state');
          }
          return const Center(child: CircularProgressIndicator());
        } else if (state is FamilyUserLoadedState) {
          if (kDebugMode) {
            print('API Family User are Loaded: $state');
          }
          return Padding(
            padding: horizontal(10),
            child: ListView.builder(
              controller: scrollController,
              padding: vertical(10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final card = state.items[index];
                return Container(
                  padding: paddingall(10),
                  margin: vertical(5),
                  decoration: const BoxDecoration(
                    color: kSkyBlue,
                    borderRadius: r15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((index + 1).toString()),
                          Text(card.name ?? ''),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.items.length,
            ),
          );
        } else if (state is FamilyUserErrorState) {
          return Center(
            key: const Key('error_message'),
            child: Text(
              state.message,
              style: const TextStyle(color: kPureBlack),
            ),
          );
        } else {
          return const Center(
            key: Key('error_message'),
            child: Text(
              'error',
              style: TextStyle(color: kPureBlack),
            ),
          );
        }
      },
    );
  }



  BlocBuilder<BenefitUserCubit, BenefitUserState> buildDataProvider() {
    return BlocBuilder<BenefitUserCubit, BenefitUserState>(
      builder: (context, state) {
        if (state is BenefitUserLoadingState) {
          if (kDebugMode) {
            print('API Benefit User are Loading $state');
          }
          return const Center(child: CircularProgressIndicator());
        } else if (state is BenefitUserLoadedState) {
          if (kDebugMode) {
            print('API Provider are Loaded: $state');
          }
          return Padding(
            padding: horizontal(10),
            child: ListView.builder(
              controller: scrollController,
              padding: vertical(10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final card = state.items[index];
                return Container(
                  padding: paddingall(10),
                  margin: vertical(5),
                  decoration: const BoxDecoration(
                    color: kSkyBlue,
                    borderRadius: r15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((index + 1).toString()),
                          Text(card.pplan ?? ''),
                          Text(card.benefitName ?? ''),
                        ],
                      ),
                      hp10,
                      Text(card.maxAmount ?? ''),
                    ],
                  ),
                );
              },
              itemCount: state.items.length,
            ),
          );
        } else if (state is BenefitUserErrorState) {
          return Center(
            key: const Key('error_message'),
            child: Text(
              state.message,
              style: const TextStyle(color: kPureBlack),
            ),
          );
        } else {
          return const SizedBox(
            child: Text("Kosong :("),
          );

        }
      },
    );
  }
}
