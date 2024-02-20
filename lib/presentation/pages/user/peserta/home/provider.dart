import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helathcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:helathcareapp/presentation/widgets/card_provider.dart';

class MapsPage extends StatefulWidget {
  static const routeName = "/maps";
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProviderLocationCubit, ProviderLocationState>(
        builder: (context, state) {
          if (state is ProviderLocationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProviderLocationLoadedState) {
            if (kDebugMode) {
              print('API List Store are Loaded: $state');
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final card = state.items[index];
                return ProvLoc(card: card);
              },
              itemCount: state.items.length,
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
            return const SizedBox();
          }
        },
      ),
    );
  }
}

