import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/presentation/cubit/provider_area_cubit.dart';
import 'package:healthcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:healthcareapp/presentation/pages/user/peserta/home/provider_search.dart';
import 'package:healthcareapp/presentation/widgets/card_provider.dart';

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
  late TextEditingController searchController;
  late FocusNode searchFocusNode; // Add FocusNode
  Timer? _debounce; // Add debounce timer

  Map<String?, dynamic> datafilter = {};
  void loadDataProvider() async {
    datafilter = {
      "name": "%%",
      "description": "%%"
    };
    Future.microtask(
          () => context.read<ProviderLocationCubit>().post(datafilter),
    );
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchFocusNode = FocusNode(); // Initialize FocusNode
    loadDataProvider();
    Future.microtask(
          () => context.read<ProviderAreaCubit>().get(),
    );
  }

  @override
  void dispose() {
    searchFocusNode.dispose(); // Dispose FocusNode
    _debounce?.cancel(); // Cancel debounce timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProviderSearch.routeName);
                },
                icon: Icon(Icons.search)
            )
          ],
        ),
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
                  Expanded(child: buildCategoryDataProvider()),
                ],
              ),
            ),
            Expanded(
              child: buildDataProvider(),
            ),
          ],
        ),

      ),
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
                  datafilter = {
                    "name": "%%",
                    "description": "%$value"
                  };
                  if (kDebugMode) {
                    print(value);
                  }
                  Future.microtask(
                        () => context.read<ProviderLocationCubit>().post(datafilter),
                  );
                });
                if (kDebugMode) {
                  print(value);
                }
              },
              items: state.items.map((card) {
                return DropdownMenuItem<String>(
                  value: card.description,
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

  BlocBuilder<ProviderLocationCubit, ProviderLocationState> buildDataProvider() {
    return BlocBuilder<ProviderLocationCubit, ProviderLocationState>(
      builder: (context, state) {
        if (state is ProviderLocationLoadingState) {
          if (kDebugMode) {
            print('API Area Provider are Loading? $state');
          }
          return const Center();
        } else if (state is ProviderLocationLoadedState) {
          return ListView.builder(
            controller: trackController,
            padding: vertical(10),
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




