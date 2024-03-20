import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:helathcareapp/domain/entities/peserta/user_family.dart';
import 'package:helathcareapp/domain/usecase/post/family_user.dart';

part 'user_family_state.dart';

class FamilyUserCubit extends Cubit<FamilyUserState> {
  FamilyUserCubit({
    required this.postFamilyUser,
  }) : super(const FamilyUserInitialState());

  final PostFamilyUser postFamilyUser;

  Future<void> get(Map datalogin) async {
    emit(const FamilyUserLoadingState());
    final result = await postFamilyUser.execute(datalogin);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(FamilyUserErrorState(failure.message)),
          (values) => emit(FamilyUserLoadedState(items: values)),
    );
  }
}
