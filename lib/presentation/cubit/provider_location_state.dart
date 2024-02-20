part of 'provider_location_cubit.dart';

abstract class ProviderLocationState extends Equatable {
  const ProviderLocationState();
  @override
  List<Object> get props => [];
}

class ProviderLocationInitialState extends ProviderLocationState {
  const ProviderLocationInitialState();
}

class ProviderLocationLoadingState extends ProviderLocationState {
  const ProviderLocationLoadingState();
}

class ProviderLocationErrorState extends ProviderLocationState {
  const ProviderLocationErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  ProviderLocationErrorState copyWith({
    String? message,
  }) {
    return ProviderLocationErrorState(
      message ?? this.message,
    );
  }
}

class ProviderLocationLoadedState extends ProviderLocationState {
  const ProviderLocationLoadedState({
    required this.items,
  });

  final List<ProviderLocation> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  ProviderLocationLoadedState copyWith({
    List<ProviderLocation>? items,
  }) {
    return ProviderLocationLoadedState(
      items: items ?? this.items,
    );
  }
}

