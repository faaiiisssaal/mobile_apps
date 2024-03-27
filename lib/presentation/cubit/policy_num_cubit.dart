import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_num.dart';
import 'package:healthcareapp/domain/usecase/post/policy_num.dart';

part 'policy_num_state.dart';

class PolicyCubit extends Cubit<PolicyState> {
  PolicyCubit({
    required this.postPolicy,
  }) : super(const PolicyInitialState());

  final PostPolicy postPolicy;

  Future<void> post(Map datapolicy) async {
    emit(const PolicyLoadingState());
    final result = await postPolicy.execute(datapolicy);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(PolicyErrorState(failure.message)),
          (values) => emit(PolicyLoadedState(items: values)),
    );
  }
}
