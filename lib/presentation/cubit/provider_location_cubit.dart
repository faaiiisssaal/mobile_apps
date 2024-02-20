import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/provider_location.dart';
import '../../domain/usecase/get_provider_loc.dart';

part 'provider_location_state.dart';

class ProviderLocationCubit extends Cubit<ProviderLocationState> {
  ProviderLocationCubit({
    required this.getProviderLocation,
  }) : super(const ProviderLocationInitialState());

  final GetProviderLocation getProviderLocation;
  Future<void> get() async {
    emit(const ProviderLocationLoadingState());
    final result = await getProviderLocation.execute();
    if (kDebugMode) {
      print('result: $result');
    }
    result.fold(
          (failure) => emit(ProviderLocationErrorState(failure.message)),
          (values) => emit(ProviderLocationLoadedState(items: values)),
    );
  }
}