part of 'provider_area_cubit.dart';

abstract class ProviderAreaState extends Equatable {
  const ProviderAreaState();
  List<Object> get props => [];
}

class ProviderAreaInitialState extends ProviderAreaState {
  const ProviderAreaInitialState();
}

class ProviderAreaLoadingState extends ProviderAreaState {
  const ProviderAreaLoadingState();
}

class ProviderAreaErrorState extends ProviderAreaState {
  const ProviderAreaErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  ProviderAreaErrorState copyWith({
    String? message,
  }) {
    return ProviderAreaErrorState(
      message ?? this.message,
    );
  }
}

class ProviderAreaLoadedState extends ProviderAreaState {
  const ProviderAreaLoadedState({
    required this.items,
  });

  final List<ProviderArea> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  ProviderAreaLoadedState copyWith({
    List<ProviderArea>? items,
  }) {
    return ProviderAreaLoadedState(
      items: items ?? this.items,
    );
  }
}
