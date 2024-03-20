// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_location.dart';

class ProviderLocationModel extends Equatable {
  const ProviderLocationModel({
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

  factory ProviderLocationModel.fromJson(Map<String, dynamic> json) => ProviderLocationModel(
        description: json['description'],
        id: json['id'],
        name: json['name'],
        address: json['address'],
        notelp: json['notelp'],
      );

  Map<String, dynamic> toJson() =>
      {"description": description, "id": id, "name": name, "address": address, "notelp": notelp,};

  ProviderLocation toEntity() {
    return ProviderLocation(description: description, id: id, name: name, address: address, notelp: notelp,);
  }

  @override
  List<Object?> get props => [description, id, name, address, notelp];
}
