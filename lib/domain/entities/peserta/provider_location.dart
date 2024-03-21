import 'package:equatable/equatable.dart';

class ProviderLocation extends Equatable {
  const ProviderLocation({
    required this.description,
    required this.id,
    required this.name,
    required this.address,
    required this.notelp,
  });

  final String? description;
  final String? id;
  final String? name;
  final String? address;
  final String? notelp;

  @override
  List<Object?> get props => [
    description,
    id,
    name,
    address,
    notelp,
  ];
}
