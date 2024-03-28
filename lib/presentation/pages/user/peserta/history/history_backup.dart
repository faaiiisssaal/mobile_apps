import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_check.dart';
import 'package:healthcareapp/presentation/cubit/policy_check_cubit.dart';
import 'package:healthcareapp/presentation/cubit/user_family_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  String? dropDownValue1;
  Future<String> _getStoredDropDownValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('member')!;
  }

  String? dropDownValue2;
  String? effectiveDate;
  String? renewalDate;

  Future<String> _getStoredDropDownValue2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('policyID')!;
  }

  Future<void> getStoredDropDownValue() async {
    String dropDownValue2 = await _getStoredDropDownValue2();
    // Call setState to rebuild the widget with the updated value
    setState(() {
      dropDownValue2 = dropDownValue2;
    });
  }

  String? memberID;
  Map<String?, dynamic> datafamily = {};
  void loadDataFamily() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    memberID = pref.getString("empID");
    datafamily = {
      "empid": "$memberID",
    };
    if (kDebugMode) {
      print(datafamily);
      print(memberID);
    }
    Future.microtask(
          () => context.read<FamilyUserCubit>().post(datafamily),
    );
  }

  String? clientID;
  Map<String?, dynamic> datapolicycheck = {};
  void loadDataPolicyCheckSort() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    clientID = pref.getString("clientID");
    datapolicycheck = {
      "clientID": "$clientID",
    };
    if (kDebugMode) {
      print(clientID);
      print(datapolicycheck);
    }
    Future.microtask(
          () => context.read<PolicyCheckCubit>().post(datapolicycheck),
    );
  }

  @override
  void initState() {
    loadDataFamily();
    getStoredDropDownValue();
    loadDataPolicyCheckSort();
    super.initState();
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
                padding: topbottomrightleft(10, 25, 15, 15),
                decoration: const BoxDecoration(
                  color: kSkyBlue,
                  borderRadius: r10,
                ),
                margin: paddingall(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Name",
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
                          wp10,
                          Expanded(child: buildBlocBuilderUserCategory())
                        ],
                      ),
                      Text(dropDownValue2 ?? 'LALA'),
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
                          wp10,
                          Expanded(child: buildBlocBuilderPolicyCheckCategory())
                        ],
                      ),
                      hp20,
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
                          wp10,
                          Expanded(
                            child: dropDownValue2 == null ? buildBlocBuilderEDate() : buildBlocBuilderEDate2(),
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

  BlocBuilder<PolicyCheckCubit, PolicyCheckState> buildBlocBuilderEDate() {
    return BlocBuilder<PolicyCheckCubit, PolicyCheckState>(
      builder: (context, state) {
        if (state is PolicyCheckLoadingState) {
          if (kDebugMode) {
            print('API PolicyCheck User are Loading $state');
          }
          return const Center(child: CircularProgressIndicator());
        } else if (state is PolicyCheckLoadedState) {
          if (kDebugMode) {
            print('API PolicyCheck User are Loaded: $state');
          }
          return Text('${state.items.first.effectiveDate!} to ${state.items.first.renewalDate!}');
        } else if (state is PolicyCheckErrorState) {
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

  BlocBuilder<PolicyCheckCubit, PolicyCheckState> buildBlocBuilderEDate2() {
    return BlocBuilder<PolicyCheckCubit, PolicyCheckState>(
      builder: (context, state) {
        if (state is PolicyCheckLoadedState) {
          // Check if dropDownValue2 is not null
          if (dropDownValue2 != null && state.items.isNotEmpty) {
            // Find the selected policy item
            var selectedPolicy = state.items.firstWhere(
                  (item) => item.policyID == dropDownValue2,
              orElse: () => const PolicyCheck(effectiveDate: '', renewalDate: '', policyID: '', clientID: ''),
            );

            // If the selected policy is found, display the effective policy
            return Text("${selectedPolicy.effectiveDate} to ${selectedPolicy.renewalDate}");
          }
        }
        // If no policy is selected or not found, display default text
        return Container(
          padding: onlyleft(15),
          child: const Text("Policy ID not selected"),
        );
      },
    );
  }

  BlocBuilder<FamilyUserCubit, FamilyUserState> buildBlocBuilderUserCategory() {
    return BlocBuilder<FamilyUserCubit, FamilyUserState>(
      builder: (context, state) {
        if (state is FamilyUserLoadingState) {
          if (kDebugMode) {
            print('API Family User are Loading $state');
          }
          return Container();
        } else if (state is FamilyUserLoadedState) {
          if (kDebugMode) {
            print('API Family User are Loaded: $state');
          }
          return FutureBuilder<String>(
            future: _getStoredDropDownValue(),
            builder: (context, snapshot) {
              final initialDropDownValue = snapshot.data ?? state.items.first.memberno;
              return DropdownButton<String>(
                isExpanded: true,
                hint: const Text("Pilih Member"),
                value: dropDownValue1 ?? initialDropDownValue,
                onChanged: (value) {
                  setState(() {
                    dropDownValue1 = value;
                    // databenefit = {"memberno": "$value", "plan": "%%"};
                    // Future.microtask(
                    //       () => context.read<BenefitUserCubit>().post(databenefit),
                    // );
                  });
                  if (kDebugMode) {
                    print(value);
                  }
                },
                items: state.items.map((card) {
                  return DropdownMenuItem<String>(
                    value: card.memberno,
                    child: Text(card.name ?? ''),
                  );
                }).toList(),
              );
            },
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

  BlocBuilder<PolicyCheckCubit, PolicyCheckState> buildBlocBuilderPolicyCheckCategory() {
    return BlocBuilder<PolicyCheckCubit, PolicyCheckState>(
      builder: (context, state) {
        if (state is PolicyCheckLoadingState) {
          if (kDebugMode) {
            print('API PolicyCheck User are Loading $state');
          }
          return const Center(child: CircularProgressIndicator());
        } else if (state is PolicyCheckLoadedState) {
          if (kDebugMode) {
            print('API PolicyCheck User are Loaded: $state');
          }
          return FutureBuilder<String>(
            future: _getStoredDropDownValue2(),
            builder: (context, snapshot) {
              final initialDropDownValue2 = snapshot.data ?? state.items.first.policyID;
              return DropdownButton<String>(
                isExpanded: true,
                value: dropDownValue2 ?? initialDropDownValue2,
                onChanged: (value) {
                  setState(() {
                    dropDownValue2 = value;
                    // databenefit = {"memberno": "$value", "plan": "%%"};
                    // Future.microtask(
                    //       () => context.read<BenefitUserCubit>().post(databenefit),
                    // );
                  });
                  if (kDebugMode) {
                    print(value);
                  }
                },
                items: state.items.map((card) {
                  return DropdownMenuItem<String>(
                    value: card.policyID,
                    child: Text(card.policyID ?? ''),
                  );
                }).toList(),
              );
            },
          );
        } else if (state is PolicyCheckErrorState) {
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
}
