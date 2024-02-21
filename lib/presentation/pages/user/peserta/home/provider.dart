import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/common/constant.dart';

import 'package:helathcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:helathcareapp/presentation/widgets/card_provider.dart';

class MapsPage extends StatefulWidget {
  static const routeName = "/maps";
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  final ScrollController _firstController = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<ProviderLocationCubit>().get(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: kDarkRed,
              child: const Center(child: Text("provider", style: TextStyle(color: kPureWhite),)),
            ),
            Expanded(child: buildBlocBuilder(),),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ProviderLocationCubit, ProviderLocationState> buildBlocBuilder() {
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
              return Scrollbar(
                interactive: true,
                controller: _firstController,
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 10,
                radius: const Radius.circular(10),
                child: ListView.separated(
                  controller: _firstController,
                  padding: paddingall(10),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final card = state.items[index];
                    return ProvLoc(card: card);
                  },
                  itemCount: state.items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                ),
              );
            } else if (state is ProviderLocationErrorState) {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.black),
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

