part of 'user_benefit_cubit.dart';

abstract class BenefitUserState extends Equatable {
  const BenefitUserState();
  @override
  List<Object> get props => [];
}

class BenefitUserInitialState extends BenefitUserState {
  const BenefitUserInitialState();
}

class BenefitUserLoadingState extends BenefitUserState {
  const BenefitUserLoadingState();
}

class BenefitUserErrorState extends BenefitUserState {
  const BenefitUserErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  BenefitUserErrorState copyWith({
    String? message,
  }) {
    return BenefitUserErrorState(
      message ?? this.message,
    );
  }
}

class BenefitUserLoadedState extends BenefitUserState {
  const BenefitUserLoadedState({
    required this.items,
  });

  final List<BenefitUser> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  BenefitUserLoadedState copyWith({
    List<BenefitUser>? items,
  }) {
    return BenefitUserLoadedState(
      items: items ?? this.items,
    );
  }
}
