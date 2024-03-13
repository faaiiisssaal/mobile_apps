// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';

import 'package:helathcareapp/domain/entities/provider_location.dart';

class ProviderLocationModel extends Equatable {
  const ProviderLocationModel({
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

  factory ProviderLocationModel.fromJson(Map<String, dynamic> json) => ProviderLocationModel(

    description   : json['description'],
        id          : json['id'],

    producttype   : json['producttype'],
        name          : json['name'],
    address   : json['address'],
      );

  Map<String, dynamic> toJson() => {
    "description": description,
        "id": id,
    "producttype": producttype,
        "name": name,
    "address": address
      };

  ProviderLocation toEntity() {
    return ProviderLocation(
      description: description,
      id: id,
      producttype: producttype,
      name: name,
      address: address
    );
  }

  @override
  List<Object?> get props => [
    description,
    id,
    producttype,
    name,
    address];
}
