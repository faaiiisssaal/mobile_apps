// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:healthcareapp/common/constant.dart';
// import 'package:healthcareapp/presentation/cubit/provider_area_cubit.dart';
// import 'package:healthcareapp/presentation/cubit/provider_location_cubit.dart';
// import 'package:healthcareapp/presentation/widgets/card_provider.dart';
//
// import '../../../../../domain/entities/peserta/provider_location.dart';
//
// class MapsPage extends StatefulWidget {
//   static const _routeName = "/maps";
//   const MapsPage({super.key});
//
//   @override
//   State<MapsPage> createState() => _MapsPageState();
// }
//
// class _MapsPageState extends State<MapsPage> {
//   final ScrollController trackController = ScrollController();
//   final ScrollController scrollController = ScrollController();
//   String? dropDownValue1;
//   List<ProviderLocation> _filteredProviders = [];
//
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(
//       () => context.read<ProviderLocationCubit>().get(),
//     );
//     Future.microtask(
//       () => context.read<ProviderAreaCubit>().get(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               margin: horizontal(20),
//               child: Row(
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         child: Text("Pilih Kota"),
//                       ),
//                       Container(
//                         padding: onlyleft(5),
//                         width: 5,
//                         child: const Text(":"),
//                       ),
//                     ],
//                   ),
//                   wp10,
//                 ],
//               ),
//             ),
//             Container(
//               padding: paddingall(10),
//               width: double.infinity,
//               child: TextField(
//                 onChanged: (value) {
//                   _filterProviders(value);
//                 },
//               ),
//             ),
//             Expanded(
//               child: BlocBuilder<ProviderLocationCubit, ProviderLocationState>(
//                 builder: (context, state) {
//                   if (state is ProviderLocationLoadedState) {
//                     _filteredProviders = state.items;
//                     return buildDataProvider();
//                   } else if (state is ProviderLocationLoadingState) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (state is ProviderLocationErrorState) {
//                     return Center(
//                       key: const Key('error_message'),
//                       child: Text(
//                         state.message,
//                         style: const TextStyle(color: kPureBlack),
//                       ),
//                     );
//                   } else {
//                     return const SizedBox(
//                       child: Text("Kosong :("),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDataProvider() {
//     return Padding(
//       padding: horizontal(10),
//       child: ListView.builder(
//         controller: trackController,
//         padding: vertical(10),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           final card = _filteredProviders[index];
//           return ProvLoc(card: card);
//         },
//         itemCount: _filteredProviders.length,
//       ),
//     );
//   }
//
//   void _filterProviders(String query) {
//     final providerLocationCubit = context.read<ProviderLocationCubit>();
//
//     if (query.isNotEmpty) {
//       if (providerLocationCubit.state is ProviderLocationLoadedState) {
//         final loadedState = providerLocationCubit.state as ProviderLocationLoadedState;
//         _filteredProviders = loadedState.items
//             .where((provider) =>
//             provider.description!.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     } else {
//       if (providerLocationCubit.state is ProviderLocationLoadedState) {
//         final loadedState = providerLocationCubit.state as ProviderLocationLoadedState;
//         _filteredProviders = loadedState.items;
//       }
//     }
//
//     setState(() {});
//   }
// }
