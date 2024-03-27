part of 'policy_num_cubit.dart';

abstract class PolicyState extends Equatable {
  const PolicyState();
  @override
  List<Object> get props => [];
}

class PolicyInitialState extends PolicyState {
  const PolicyInitialState();
}

class PolicyLoadingState extends PolicyState {
  const PolicyLoadingState();
}

class PolicyErrorState extends PolicyState {
  const PolicyErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  PolicyErrorState copyWith({
    String? message,
  }) {
    return PolicyErrorState(
      message ?? this.message,
    );
  }
}

class PolicyLoadedState extends PolicyState {
  const PolicyLoadedState({
    required this.items,
  });

  final List<Policy> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  PolicyLoadedState copyWith({
    List<Policy>? items,
  }) {
    return PolicyLoadedState(
      items: items ?? this.items,
    );
  }
}
