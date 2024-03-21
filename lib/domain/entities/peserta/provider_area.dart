import 'package:equatable/equatable.dart';

class ProviderArea extends Equatable {
  const ProviderArea({
    required this.area,
    required this.description,
  });

  final String? area;
  final String? description;

  @override
  List<Object?> get props => [
    area,
    description,
  ];
}
