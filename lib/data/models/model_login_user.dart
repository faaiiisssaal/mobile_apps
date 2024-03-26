// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/login_user.dart';

class LoginUserModel extends Equatable {
  const LoginUserModel({
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
    required this.opDetail});

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

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        companyName: json['companyName'],
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
        "companyName": companyName,
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
      companyName: companyName,
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
