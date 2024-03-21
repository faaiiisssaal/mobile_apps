import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/common/constant.dart';
import 'package:helathcareapp/presentation/cubit/provider_area_cubit.dart';

import 'package:helathcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:helathcareapp/presentation/widgets/card_provider.dart';

class MapsPage extends StatefulWidget {
  static const routeName = "/maps";
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  final ScrollController trackController = ScrollController();
  final ScrollController scrollController = ScrollController();
  String? dropDownValue1;

  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<ProviderLocationCubit>().get(),
    );
    Future.microtask(
          () => context.read<ProviderAreaCubit>().get(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: horizontal(20),
              child: Row(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        child: Text("Pilih Kota"),
                      ),
                      Container(
                        padding: onlyleft(5),
                        width: 5,
                        child: const Text(":"),
                      ),
                    ],
                  ),
                  wp10,
                  Expanded(child: buildCategoryDataProvider())
                ],
              ),
            ),
            Container(
              padding: paddingall(10),
              width: double.infinity,
              child: const TextField(
              ),
            ),
            Expanded(child: buildDataProvider(),),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ProviderLocationCubit, ProviderLocationState> buildDataProvider() {
    return BlocBuilder<ProviderLocationCubit, ProviderLocationState>(
          builder: (context, state) {
            if (state is ProviderLocationLoadingState) {
              if (kDebugMode) {
                print('API Provider are Loading? $state');
              }
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProviderLocationLoadedState) {
              if (kDebugMode) {
                print('API Provider are Loaded: $state');
              }
              return Padding(
                padding: horizontal(10),
                child: ListView.builder(
                  controller: trackController,
                  padding: vertical(10),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final card = state.items[index];
                    return ProvLoc(card: card);
                  },
                  itemCount: state.items.length,
                ),
              );
            } else if (state is ProviderLocationErrorState) {
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

  BlocBuilder<ProviderAreaCubit, ProviderAreaState> buildCategoryDataProvider() {
    return BlocBuilder<ProviderAreaCubit, ProviderAreaState>(
      builder: (context, state) {
        if (state is ProviderAreaLoadingState) {
          if (kDebugMode) {
            print('API Area Provider are Loading? $state');
          }
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProviderAreaLoadedState) {
          if (kDebugMode) {
            print('API Area Provider are Loaded: $state');
          }
          return Padding(
            padding: horizontal(10),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: const Text("Pilih Kota"),
              value: dropDownValue1,
              onChanged: (value) {
                setState(() {
                  dropDownValue1 = value;
                });
                if (kDebugMode) {
                  print(value);
                }
              },
              items: state.items.map((card) {
                return DropdownMenuItem<String>(
                  value: card.area,
                  child: Text(card.description ?? ''),
                );
              }).toList(),
            ),
          );
        } else if (state is ProviderAreaErrorState) {
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




