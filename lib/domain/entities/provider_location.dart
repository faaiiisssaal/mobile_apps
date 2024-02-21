import 'package:equatable/equatable.dart';

class ProviderLocation extends Equatable {
  const ProviderLocation({
    required this.area,
    required this.description,
    required this.name,
  });

  final String? area;
  final String? description;
  final String? name;

  @override
  // TODO: implement props
  List<Object?> get props => [
    area,
    description,
    name
  ];
}
