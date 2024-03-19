import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/login_user.dart';
import '../../domain/usecase/post/post_login_user.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit({
    required this.postLoginUser,
  }) : super(const LoginUserInitialState());

  final PostLoginUser postLoginUser;

  Future<void> get(Map datalogin) async {
    emit(const LoginUserLoadingState());
    final result = await postLoginUser.execute(datalogin);
    if (kDebugMode) {
      print('Result: $result');
    }
    result.fold(
          (failure) => emit(LoginUserErrorState(failure.message)),
          (values) => emit(LoginUserLoadedState(items: values)),
    );
  }
}
