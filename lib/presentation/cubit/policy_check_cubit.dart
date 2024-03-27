import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_check.dart';
import 'package:healthcareapp/domain/usecase/post/policy_check.dart';

part 'policy_check_state.dart';

class PolicyCheckCubit extends Cubit<PolicyCheckState> {
  PolicyCheckCubit({
    required this.postPolicyCheck,
  }) : super(const PolicyCheckInitialState());

  final PostPolicyCheck postPolicyCheck;

  Future<void> post(Map datapolicycheck) async {
    emit(const PolicyCheckLoadingState());
    final result = await postPolicyCheck.execute(datapolicycheck);
    if (kDebugMode) {
      print('rrrresult: $result');
    }
    result.fold(
          (failure) => emit(PolicyCheckErrorState(failure.message)),
          (values) => emit(PolicyCheckLoadedState(items: values)),
    );
  }
}
