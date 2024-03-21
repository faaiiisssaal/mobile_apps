import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_area.dart';
import 'package:helathcareapp/domain/usecase/get/provider_area.dart';

part 'provider_area_state.dart';

class ProviderAreaCubit extends Cubit<ProviderAreaState> {
  ProviderAreaCubit({
    required this.getProviderArea,
  }) : super(const ProviderAreaInitialState());

  final GetProviderArea getProviderArea;

  Future<void> get() async {
    emit(const ProviderAreaLoadingState());
    final result = await getProviderArea.execute();
    result.fold(
          (failure) => emit(ProviderAreaErrorState(failure.message)),
          (values) => emit(ProviderAreaLoadedState(items: values)),
    );
  }
}
