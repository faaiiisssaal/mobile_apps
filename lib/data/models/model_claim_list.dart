// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_list.dart';

class ClaimListUserModel extends Equatable {
  const ClaimListUserModel({
    required this.cno,
    required this.benefitName,
    required this.verified,
    required this.accepted,
    required this.bLimit,
    required this.accepted1,
    required this.excess,
  });

  final String? cno;
  final String? benefitName;
  final String? verified;
  final String? accepted;
  final String? bLimit;
  final String? accepted1;
  final int? excess;

  factory ClaimListUserModel.fromJson(Map<String, dynamic> json) => ClaimListUserModel(
      cno: json['cno'],
      benefitName: json['benefitName'],
      verified: json['verified'],
      accepted: json['accepted'],
      bLimit: json['bLimit'],
      accepted1: json['accepted1'],
      excess: json['excess']);

  Map<String, dynamic> toJson() => {
    "cno": cno,
    "benefitName": benefitName,
    "verified": verified,
    "accepted": accepted,
    "bLimit": bLimit,
    "accepted1": accepted1,
    "excess": excess,
  };

  ClaimListUser toEntity() {
    return ClaimListUser(
      cno: cno,
      benefitName: benefitName,
      verified: verified,
      accepted: accepted,
      bLimit: bLimit,
      accepted1: accepted1,
      excess: excess,
    );
  }

  @override
  List<Object?> get props => [
    cno,
    benefitName,
    verified,
    accepted,
    bLimit,
    accepted1,
    excess,
  ];
}
