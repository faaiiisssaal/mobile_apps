import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_list.dart';
import 'package:healthcareapp/domain/usecase/post/claim_list_member.dart';

part 'claim_list_state.dart';

class ClaimListUserCubit extends Cubit<ClaimListUserState> {
  ClaimListUserCubit({
    required this.postClaimListUser,
  }) : super(const ClaimListUserInitialState());

  final PostClaimListUser postClaimListUser;

  Future<void> get(Map datalogin) async {
    emit(const ClaimListUserLoadingState());
    final result = await postClaimListUser.execute(datalogin);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(ClaimListUserErrorState(failure.message)),
          (values) => emit(ClaimListUserLoadedState(items: values)),
    );
  }
}