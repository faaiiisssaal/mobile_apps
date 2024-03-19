// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';

class LoginUserModel extends Equatable {
  const LoginUserModel(
      {required this.companyNo,
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
      required this.opDetail});

  final String? companyNo;
  final String? policyNo;
  final String? cardNo;
  final String? empID;
  final String? memberID;
  final String? memberName;
  final String? classNo;
  final String? memberSex;
  final String? memberPlan;
  final String? memberBirthDate;
  final String? effectiveDate;
  final String? ipDetail;
  final String? opDetail;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        companyNo: json['companyNo'],
        policyNo: json['policyNo'],
        cardNo: json['cardNo'],
        empID: json['empID'],
        memberID: json['memberID'],
        memberName: json['memberName'],
        classNo: json['classNo'],
        memberSex: json['memberSex'],
        memberPlan: json['memberPlan'],
        memberBirthDate: json['memberBirthDate'],
        effectiveDate: json['effectiveDate'],
        ipDetail: json['ipDetail'],
        opDetail: json['opDetail'],
      );

  Map<String, dynamic> toJson() => {
        "companyNo": companyNo,
        "policyNo": policyNo,
        "cardNo": cardNo,
        "empID": empID,
        "memberID": memberID,
        "memberName": memberName,
        "classNo": classNo,
        "memberSex": memberSex,
        "memberPlan": memberPlan,
        "memberBirthDate": memberBirthDate,
        "effectiveDate": effectiveDate,
        "ipDetail": ipDetail,
        "opDetail": opDetail,
      };

  LoginUser toEntity() {
    return LoginUser(
      companyNo: companyNo,
      policyNo: policyNo,
      cardNo: cardNo,
      empID: empID,
      memberID: memberID,
      memberName: memberName,
      classNo: classNo,
      memberSex: memberSex,
      memberPlan: memberPlan,
      memberBirthDate: memberBirthDate,
      effectiveDate: effectiveDate,
      ipDetail: ipDetail,
      opDetail: opDetail,
    );
  }

  @override
  List<Object?> get props => [
        companyNo,
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
