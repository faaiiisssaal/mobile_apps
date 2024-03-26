// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_area.dart';

class ProviderAreaModel extends Equatable {
  const ProviderAreaModel({
    required this.area,
    required this.description,
  });

  final String? area;
  final String? description;

  factory ProviderAreaModel.fromJson(Map<String, dynamic> json) => ProviderAreaModel(
    area: json['area'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() =>
      {"area": area, "description": description};

  ProviderArea toEntity() {
    return ProviderArea(area: area, description: description,);
  }

  @override
  List<Object?> get props => [area, description, ];
}
