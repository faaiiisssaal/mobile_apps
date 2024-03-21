import 'package:equatable/equatable.dart';

class BenefitUser extends Equatable {
  const BenefitUser({
    required this.no,
    required this.benefitName,
    required this.maxAmount,
    required this.pplan,
    required this.planName,
    required this.benefitID,
    required this.benefitNo,
    required this.annualLimit,
    required this.overalllimitamount
  });

  final String? no;
  final String? benefitName;
  final String? maxAmount;
  final String? pplan;
  final String? planName;
  final String? benefitID;
  final int? benefitNo;
  final String? annualLimit;
  final int? overalllimitamount;

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
