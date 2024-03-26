import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';
import 'package:healthcareapp/domain/usecase/post/provider_loc.dart';

part 'provider_location_state.dart';

class ProviderLocationCubit extends Cubit<ProviderLocationState> {
  ProviderLocationCubit({
    required this.postProviderLocation,
  }) : super(const ProviderLocationInitialState());

  final PostProviderLocation postProviderLocation;

  Future<void> post(Map datafilter) async {
    emit(const ProviderLocationLoadingState());
    final result = await postProviderLocation.execute(datafilter);
    if (kDebugMode) {
      print('result: $result');
    }
    result.fold(
          (failure) => emit(ProviderLocationErrorState(failure.message)),
          (values) => emit(ProviderLocationLoadedState(items: values)),
    );
  }
}
