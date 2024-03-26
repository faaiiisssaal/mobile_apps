import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcareapp/common/constant.dart';
import 'package:healthcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:healthcareapp/presentation/widgets/card_provider.dart';

class ProviderSearch extends StatefulWidget {
  static const routeName = "/search";
  const ProviderSearch({super.key});

  @override
  State<ProviderSearch> createState() => _ProviderSearchState();
}

class _ProviderSearchState extends State<ProviderSearch> {
  TextEditingController searchController = TextEditingController();
  ScrollController trackController = ScrollController();
  bool _showClearButton = false;
  Map<String?, dynamic> datafilter = {};
  void loadDataProvider() async {
    datafilter = {"search1": "", "search2": ""};
    Future.microtask(
      () => context.read<ProviderLocationCubit>().post(datafilter),
    );
  }

  @override
  void initState() {
    super.initState();
    loadDataProvider();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _showClearButton = searchController.text.isNotEmpty;
    });
  }

  void _clearSearch() {
    setState(() {
      searchController.clear();
      _showClearButton = false;
      datafilter = {"name": "", "description": ""};
      Future.microtask(
            () => context.read<ProviderLocationCubit>().post(datafilter),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 4.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    datafilter = {"name": "%$value%", "description": "%%"};
                    Future.microtask(
                      () => context.read<ProviderLocationCubit>().post(datafilter),
                    );
                    _onSearchChanged();
                  },
                ),
              ),
              _showClearButton
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                      onPressed: _clearSearch,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildDataProvider(),
          ),
        ],
      ),
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
