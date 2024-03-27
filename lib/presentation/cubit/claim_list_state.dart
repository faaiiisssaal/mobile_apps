part of 'claim_list_cubit.dart';

abstract class ClaimListUserState extends Equatable {
  const ClaimListUserState();
  @override
  List<Object> get props => [];
}

class ClaimListUserInitialState extends ClaimListUserState {
  const ClaimListUserInitialState();
}

class ClaimListUserLoadingState extends ClaimListUserState {
  const ClaimListUserLoadingState();
}

class ClaimListUserErrorState extends ClaimListUserState {
  const ClaimListUserErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  ClaimListUserErrorState copyWith({
    String? message,
  }) {
    return ClaimListUserErrorState(
      message ?? this.message,
    );
  }
}

class ClaimListUserLoadedState extends ClaimListUserState {
  const ClaimListUserLoadedState({
    required this.items,
  });

  final List<ClaimListUser> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  ClaimListUserLoadedState copyWith({
    List<ClaimListUser>? items,
  }) {
    return ClaimListUserLoadedState(
      items: items ?? this.items,
    );
  }
}
