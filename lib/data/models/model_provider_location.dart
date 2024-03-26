// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';

class ProviderLocationModel extends Equatable {
  const ProviderLocationModel(
      {required this.description,
      required this.id,
      required this.name,
      required this.address,
      required this.notelp,
      required this.ip,
      required this.op,
      required this.dt,
      required this.ma});

  final String? description;
  final String? id;
  final String? name;
  final String? address;
  final String? notelp;
  final int? ip;
  final int? op;
  final int? dt;
  final int? ma;

  factory ProviderLocationModel.fromJson(Map<String, dynamic> json) => ProviderLocationModel(
      description: json['description'],
      id: json['id'],
      name: json['name'],
      address: json['address'],
      notelp: json['notelp'],
      ip: json['ip'],
      op: json['op'],
      dt: json['dt'],
      ma: json['ma']);

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": name,
        "address": address,
        "notelp": notelp,
        "ip": ip,
        "op": op,
        "dt": dt,
        "ma": ma,
      };

  ProviderLocation toEntity() {
    return ProviderLocation(
      description: description,
      id: id,
      name: name,
      address: address,
      notelp: notelp,
      ip: ip,
      op: op,
      dt: dt,
      ma: ma
    );
  }

  @override
  List<Object?> get props => [description, id, name, address, notelp, ip, op, dt, ma];
}
