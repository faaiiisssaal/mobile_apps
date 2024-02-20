import 'package:equatable/equatable.dart';

class ProviderLocation extends Equatable {
  const ProviderLocation({
    required this.area,
    required this.description,
  });

  final String? area;
  final String? description;

  @override
  // TODO: implement props
  List<Object?> get props => [
    area,
  ];
}
