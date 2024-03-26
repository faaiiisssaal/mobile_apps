// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/user_family.dart';

class FamilyUserModel extends Equatable {
  const FamilyUserModel({
    required this.memberno,
    required this.name,
  });

  final String? memberno;
  final String? name;

  factory FamilyUserModel.fromJson(Map<String, dynamic> json) => FamilyUserModel(
    memberno: json['memberno'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() =>
      {"memberno": memberno, "name": name};

  FamilyUser toEntity() {
    return FamilyUser(memberno: memberno, name: name,);
  }

  @override
  List<Object?> get props => [memberno, name, ];
}
