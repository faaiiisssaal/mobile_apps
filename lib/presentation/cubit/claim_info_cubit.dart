import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_info.dart';
import 'package:healthcareapp/domain/usecase/post/claim_info.dart';

part 'claim_info_state.dart';

class ClaimInfoUserCubit extends Cubit<ClaimInfoUserState> {
  ClaimInfoUserCubit({
    required this.postClaimInfoUser,
  }) : super(const ClaimInfoUserInitialState());

  final PostClaimInfoUser postClaimInfoUser;

  Future<void> get(Map datalogin) async {
    emit(const ClaimInfoUserLoadingState());
    final result = await postClaimInfoUser.execute(datalogin);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(ClaimInfoUserErrorState(failure.message)),
          (values) => emit(ClaimInfoUserLoadedState(items: values)),
    );
  }
}
