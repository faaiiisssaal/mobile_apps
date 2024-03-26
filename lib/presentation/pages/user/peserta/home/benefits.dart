import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:healthcareapp/presentation/cubit/user_benefit_cubit.dart';
import 'package:healthcareapp/presentation/cubit/user_family_cubit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BenefitPage extends StatefulWidget {
  static const routeName = "/benefit";
  const BenefitPage({super.key});

  @override
  State<BenefitPage> createState() => _BenefitPageState();
}

class _BenefitPageState extends State<BenefitPage> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  List<dynamic> filteredItems = [];
  String? dropDownValue1;

  String? memberNo;
  Map<String?, dynamic> databenefit = {};
  void loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    memberNo = pref.getString("memberID");
    if (kDebugMode) {
      print(memberNo);
    }
    databenefit = {
      "memberno": "%%",
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
  void dispose() {
    super.dispose();
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
                height: 100,
                decoration: const BoxDecoration(
                  color: kSkyBlue,
                  borderRadius: r10,
                ),
                margin: topleftright(10, 10, 10),
                child: SingleChildScrollView(
                  padding: paddingall(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                child: Text("Member Name"),
                              ),
                              Container(
                                padding: onlyleft(5),
                                width: 5,
                                child: const Text(":"),
                              ),
                            ],
                          ),
                          wp10,
                          Expanded(child: buildBlocBuilderMenuCategory())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              hp20,
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
          return const Center(child: SizedBox(height: 15, width: 15, child: CircularProgressIndicator()));
        } else if (state is FamilyUserLoadedState) {
          if (kDebugMode) {
            print('API Family User are Loaded: $state');
          }
          return DropdownButton<String>(
            isExpanded: true,
            hint: const Text("Pilih Member"),
            value: dropDownValue1,
            onChanged: (value) {
              setState(() {
                dropDownValue1 = value;
                databenefit = {"memberno": "$value", "plan": "%%"};
                Future.microtask(
                  () => context.read<BenefitUserCubit>().post(databenefit),
                );
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

          // Group items by pplan value
          Map<String, List<BenefitUser>> groupedItems = {};
          for (var item in state.items) {
            String pplan = item.planName ?? '';
            groupedItems.putIfAbsent(pplan, () => []);
            groupedItems[pplan]?.add(item);
            if (kDebugMode) {
              print(pplan);
            }
          }

          List<Widget> tables = [];
          groupedItems.forEach((pplan, items) {
            tables.add(
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 0,
                      color: kPureWhite,
                      shadowColor: kLightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin: vertical(5),
                      child: ExpansionTile(

                        collapsedShape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        title: Text(pplan),
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              // Adjusted width
                              width: double.infinity,
                              child: DataTable(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0),
                                  borderRadius: r15, // Hide table borders
                                ),
                                headingRowColor: MaterialStateColor.resolveWith((states) => kSkyBlue),
                                columns: const [
                                  DataColumn(label: Text('No')),
                                  DataColumn(label: Text('Jenis Manfaat')),
                                  DataColumn(label: Text('Batas\nSantunan')),
                                ],
                                columnSpacing: 10,
                                dataRowMaxHeight: double.infinity,
                                horizontalMargin: 10,
                                // Removed Expanded widget
                                rows: items.map((card) {
                                  return DataRow(cells: [
                                    DataCell(Text((items.indexOf(card) + 1).toString())),
                                    DataCell(
                                      Padding(
                                        padding: vertical(5),
                                        child: Text(
                                          card.benefitName ?? '-',
                                          maxLines: 8,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        card.maxAmount != null && card.maxAmount == "Sesuai Tagihan"
                                            ? "Sesuai Tagihan"
                                            : 'Rp. ${card.maxAmount != null ? NumberFormat("#,##0", "id_ID").format(double.parse(card.maxAmount ?? '')) : '-'}',
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  hp20, // Add space between ExpansionTiles
                ],
              ),
            );
          });
          return SingleChildScrollView(
            child: Column(
              children: tables,
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
          return const Center(
            child: SizedBox(
              child: Text("Kosong :("),
            ),
          );
        }
      },
    );
  }
}
