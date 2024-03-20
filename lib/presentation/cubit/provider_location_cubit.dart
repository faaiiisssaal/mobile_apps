import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_location.dart';
import 'package:helathcareapp/domain/usecase/get/get_provider_loc.dart';

part 'provider_location_state.dart';

class ProviderLocationCubit extends Cubit<ProviderLocationState> {
  ProviderLocationCubit({
    required this.getProviderLocation,
  }) : super(const ProviderLocationInitialState());

  final GetProviderLocation getProviderLocation;
  late List<ProviderLocation> allProviders = []; // Adjusted to ProviderLocation

  Future<void> get() async {
    emit(const ProviderLocationLoadingState());
    final result = await getProviderLocation.execute();
    result.fold(
          (failure) => emit(ProviderLocationErrorState(failure.message)),
          (values) {
        allProviders = values;
        emit(ProviderLocationLoadedState(items: values));
      },
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(ProviderLocationLoadedState(items: allProviders));
    } else {
      final filteredProviders = allProviders.where((provider) =>
      provider.name?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
      emit(ProviderLocationLoadedState(items: filteredProviders));
    }
  }
}
