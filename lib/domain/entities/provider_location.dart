import 'package:equatable/equatable.dart';

class ProviderLocation extends Equatable {
  const ProviderLocation({
    required this.description,
    required this.id,
    required this.producttype,
    required this.name,
    required this.address,
  });

  final String? description;
  final String? id;
  final String? producttype;
  final String? name;
  final String? address;

  @override
  // TODO: implement props
  List<Object?> get props => [
    description,
    id,
    producttype,
    name,
    address
  ];
}
