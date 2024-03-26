import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';

import '../../domain/usecase/post/benefit_user.dart';

part 'user_benefit_state.dart';

class BenefitUserCubit extends Cubit<BenefitUserState> {
  BenefitUserCubit({
    required this.postBenefitUser,
  }) : super(const BenefitUserInitialState());

  final PostBenefitUser postBenefitUser;

  Future<void> post(Map databenefit) async {
    emit(const BenefitUserLoadingState());
    final result = await postBenefitUser.execute(databenefit);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(BenefitUserErrorState(failure.message)),
          (values) => emit(BenefitUserLoadedState(items: values)),
    );
  }
}
