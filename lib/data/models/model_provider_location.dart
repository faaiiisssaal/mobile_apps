// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';

import 'package:helathcareapp/domain/entities/provider_location.dart';

class ProviderLocationModel extends Equatable {
  const ProviderLocationModel({
    required this.area,
    required this.description,
    required this.name,
  });

  final String? area;
  final String? description;
  final String? name;

  factory ProviderLocationModel.fromJson(Map<String, dynamic> json) => ProviderLocationModel(
        area          : json['area'],
        description   : json['description'],
        name          : json['name'],
      );

  Map<String, dynamic> toJson() => {
        "area": area,
        "description": description,
        "name": name,
      };

  ProviderLocation toEntity() {
    return ProviderLocation(
      area: area,
      description: description,
      name: name,
    );
  }

  @override
  List<Object?> get props => [area, description, name];
}
