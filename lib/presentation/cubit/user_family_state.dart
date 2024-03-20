part of 'user_family_cubit.dart';

abstract class FamilyUserState extends Equatable {
  const FamilyUserState();
  List<Object> get props => [];
}

class FamilyUserInitialState extends FamilyUserState {
  const FamilyUserInitialState();
}

class FamilyUserLoadingState extends FamilyUserState {
  const FamilyUserLoadingState();
}

class FamilyUserErrorState extends FamilyUserState {
  const FamilyUserErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  FamilyUserErrorState copyWith({
    String? message,
  }) {
    return FamilyUserErrorState(
      message ?? this.message,
    );
  }
}

class FamilyUserLoadedState extends FamilyUserState {
  const FamilyUserLoadedState({
    required this.items,
  });

  final List<FamilyUser> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  FamilyUserLoadedState copyWith({
    List<FamilyUser>? items,
  }) {
    return FamilyUserLoadedState(
      items: items ?? this.items,
    );
  }
}
