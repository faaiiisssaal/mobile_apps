// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_check.dart';

class PolicyCheckModel extends Equatable {
  const PolicyCheckModel(
      {required this.effectiveDate, required this.renewalDate, required this.policyID, required this.clientID});

  final String? effectiveDate;
  final String? renewalDate;
  final String? policyID;
  final String? clientID;

  factory PolicyCheckModel.fromJson(Map<String, dynamic> json) => PolicyCheckModel(
      effectiveDate: json['effectiveDate'],
      renewalDate: json['renewalDate'],
      policyID: json['policyID'],
      clientID: json['clientID']);

  Map<String, dynamic> toJson() =>
      {"effectiveDate": effectiveDate, "renewalDate": renewalDate, "policyID": policyID, "clientID": clientID};

  PolicyCheck toEntity() {
    return PolicyCheck(effectiveDate: effectiveDate, renewalDate: renewalDate, policyID: policyID, clientID: clientID);
  }

  @override
  List<Object?> get props => [effectiveDate, renewalDate, policyID, clientID];
}
