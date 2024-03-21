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
              height: 100,
              padding: paddingall(10),
              width: double.infinity,
              child: const TextField(
                
              ),
            ),
            Container(
              height: 50,
              margin: horizontal(20),
              color: kSapphireBlue,
            ),
            Container(child: buildCategoryDataProvider(),),
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
          return Container(
            height: 50,
            margin: horizontal(20),
            padding: vertical(10),
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final categories = state.items[index];
                return InkWell(
                  child: Container(
                    margin: horizontal(5),
                    padding: paddingall(5),
                    decoration: BoxDecoration(
                      color: kSkyBlue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      categories.description ?? '-'
                    ),
                  ),
                );
              },
              itemCount: state.items.length,
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

