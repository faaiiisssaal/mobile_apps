// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';

class BenefitUserModel extends Equatable {
  const BenefitUserModel(
      {required this.no,
      required this.benefitName,
      required this.maxAmount,
      required this.pplan,
        required this.planName,
      required this.benefitID,
      required this.benefitNo,
      required this.annualLimit,
      required this.overalllimitamount});

  final String? no;
  final String? benefitName;
  final String? maxAmount;
  final String? pplan;
  final String? planName;
  final String? benefitID;
  final int? benefitNo;
  final String? annualLimit;
  final int? overalllimitamount;

  factory BenefitUserModel.fromJson(Map<String, dynamic> json) => BenefitUserModel(
        no: json['no'],
        benefitName: json['benefitName'],
        maxAmount: json['maxAmount'],
        pplan: json['pplan'],
        planName: json['planName'],
        benefitID: json['benefitID'],
        benefitNo: json['benefitNo'],
        annualLimit: json['annualLimit'],
        overalllimitamount: json['overalllimitamount'],
      );

  Map<String, dynamic> toJson() => {
    "no": no, 
    "benefitName": benefitName,
    "maxAmount": maxAmount,
    "pplan": pplan,
    "planName": planName,
    "benefitID": benefitID,
    "benefitNo": benefitNo,
    "annualLimit": annualLimit,
    "overalllimitamount": overalllimitamount,
  };

  BenefitUser toEntity() {
    return BenefitUser(
      no: no,
      benefitName: benefitName,
      maxAmount: maxAmount,
      pplan: pplan,
      planName: planName,
      benefitID: benefitID,
      benefitNo: benefitNo,
      annualLimit: annualLimit,
      overalllimitamount: overalllimitamount,
    );
  }

  @override
  List<Object?> get props => [
        no,
        benefitName,
        maxAmount,
        pplan,
        planName,
        benefitID,
        benefitNo,
        annualLimit,
        overalllimitamount,
      ];
}
