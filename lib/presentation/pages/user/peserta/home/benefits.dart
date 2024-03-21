import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:helathcareapp/presentation/cubit/user_benefit_cubit.dart';
import 'package:helathcareapp/presentation/cubit/user_family_cubit.dart';
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
                          Expanded(
                            child: Row(
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
                          ),
                          Expanded(
                              child: buildBlocBuilderMenuCategory()
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
          String? naMe = state.items.first.name;
          print(naMe);
          return Padding(
            padding: horizontal(10),
            child: DropdownButton<String>(
              isExpanded: true,
              value: state.items.first.name,
              onChanged: (newValue) {
                naMe = newValue;
              },
              items: state.items.map((card) {
                return DropdownMenuItem<String>(
                  value: card.name,
                  child: Text(card.name ?? ''),
                );
              }).toList(),
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0), // Hide table borders
                      ),
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
                            child: SizedBox( // Adjusted width
                              width: double.infinity,
                              child: DataTable(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0), // Hide table borders
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
                  const SizedBox(height: 16), // Add space between ExpansionTiles
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
          return const SizedBox(
            child: Text("Kosong :("),
          );
        }
      },
    );
  }

}
