part of 'claim_info_cubit.dart';

abstract class ClaimInfoUserState extends Equatable {
  const ClaimInfoUserState();
  @override
  List<Object> get props => [];
}

class ClaimInfoUserInitialState extends ClaimInfoUserState {
  const ClaimInfoUserInitialState();
}

class ClaimInfoUserLoadingState extends ClaimInfoUserState {
  const ClaimInfoUserLoadingState();
}

class ClaimInfoUserErrorState extends ClaimInfoUserState {
  const ClaimInfoUserErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  ClaimInfoUserErrorState copyWith({
    String? message,
  }) {
    return ClaimInfoUserErrorState(
      message ?? this.message,
    );
  }
}

class ClaimInfoUserLoadedState extends ClaimInfoUserState {
  const ClaimInfoUserLoadedState({
    required this.items,
  });

  final List<ClaimInfoUser> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  ClaimInfoUserLoadedState copyWith({
    List<ClaimInfoUser>? items,
  }) {
    return ClaimInfoUserLoadedState(
      items: items ?? this.items,
    );
  }
}
