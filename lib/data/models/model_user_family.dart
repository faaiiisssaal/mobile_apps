// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/domain/entities/peserta/user_family.dart';

class FamilyUserModel extends Equatable {
  const FamilyUserModel({
    required this.memberno,
    required this.plan,
  });

  final String? memberno;
  final String? plan;

  factory FamilyUserModel.fromJson(Map<String, dynamic> json) => FamilyUserModel(
    memberno: json['memberno'],
    plan: json['plan'],
  );

  Map<String, dynamic> toJson() =>
      {"memberno": memberno, "plan": plan};

  FamilyUser toEntity() {
    return FamilyUser(memberno: memberno, plan: plan,);
  }

  @override
  List<Object?> get props => [memberno, plan, ];
}
