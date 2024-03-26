import 'package:equatable/equatable.dart';

class ProviderLocation extends Equatable {
  const ProviderLocation(
      {
        required this.description,
      required this.id,
      required this.name,
      required this.address,
      required this.notelp,
      required this.ip,
      required this.op,
      required this.dt,
      required this.ma
      });

  final String? description;
  final String? id;
  final String? name;
  final String? address;
  final String? notelp;
  final int? ip;
  final int? op;
  final int? dt;
  final int? ma;

  @override
  List<Object?> get props => [description, id, name, address, notelp, ip, op, dt, ma];
}
