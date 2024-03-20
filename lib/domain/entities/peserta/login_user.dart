import 'package:equatable/equatable.dart';

class LoginUser extends Equatable {
  const LoginUser({
    required this.companyName,
    required this.policyNo,
    required this.cardNo,
    required this.empID,
    required this.memberID,
    required this.memberName,
    required this.classNo,
    required this.memberSex,
    required this.memberPlan,
    required this.memberBirthDate,
    required this.effectiveDate,
    required this.ipDetail,
    required this.opDetail
  });

  final String? companyName;
  final String? policyNo;
  final String? cardNo;
  final String? empID;
  final String? memberID;
  final String? memberName;
  final int? classNo;
  final String? memberSex;
  final String? memberPlan;
  final String? memberBirthDate;
  final String? effectiveDate;
  final String? ipDetail;
  final String? opDetail;

  @override
  // TODO: implement props
  List<Object?> get props => [
    companyName,
    policyNo,
    cardNo,
    empID,
    memberID,
    memberName,
    classNo,
    memberSex,
    memberPlan,
    memberBirthDate,
    effectiveDate,
    ipDetail,
    opDetail,
  ];
}
