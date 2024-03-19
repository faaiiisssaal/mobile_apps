part of 'login_user_cubit.dart';

abstract class LoginUserState extends Equatable {
  const LoginUserState();
  @override
  List<Object> get props => [];
}

class LoginUserInitialState extends LoginUserState {
  const LoginUserInitialState();
}

class LoginUserLoadingState extends LoginUserState {
  const LoginUserLoadingState();
}

class LoginUserErrorState extends LoginUserState {
  const LoginUserErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  LoginUserErrorState copyWith({
    String? message,
  }) {
    return LoginUserErrorState(
      message ?? this.message,
    );
  }
}

class LoginUserLoadedState extends LoginUserState {
  const LoginUserLoadedState({
    required this.items,
  });

  final List<LoginUser> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  LoginUserLoadedState copyWith({
    List<LoginUser>? items,
  }) {
    return LoginUserLoadedState(
      items: items ?? this.items,
    );
  }
}
