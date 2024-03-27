part of 'policy_check_cubit.dart';

abstract class PolicyCheckState extends Equatable {
  const PolicyCheckState();
  @override
  List<Object> get props => [];
}

class PolicyCheckInitialState extends PolicyCheckState {
  const PolicyCheckInitialState();
}

class PolicyCheckLoadingState extends PolicyCheckState {
  const PolicyCheckLoadingState();
}

class PolicyCheckErrorState extends PolicyCheckState {
  const PolicyCheckErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  PolicyCheckErrorState copyWith({
    String? message,
  }) {
    return PolicyCheckErrorState(
      message ?? this.message,
    );
  }
}

class PolicyCheckLoadedState extends PolicyCheckState {
  const PolicyCheckLoadedState({
    required this.items,
  });

  final List<PolicyCheck> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  PolicyCheckLoadedState copyWith({
    List<PolicyCheck>? items,
  }) {
    return PolicyCheckLoadedState(
      items: items ?? this.items,
    );
  }
}
