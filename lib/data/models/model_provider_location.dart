// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';

import 'package:helathcareapp/domain/entities/provider_location.dart';

class ProviderLocationModel extends Equatable {
  const ProviderLocationModel(
      {required this.area,
        required this.description,
      });

  final String? area;
  final String? description;

  factory ProviderLocationModel.fromJson(Map<String, dynamic> json) =>
      ProviderLocationModel(
        area: json['area'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
    "area": area,
    "description": description,
  };

  ProviderLocation toEntity() {
    return ProviderLocation(
      area: area,
      description: description,
    );
  }

  @override
  List<Object?> get props => [
    area,
  ];
}
