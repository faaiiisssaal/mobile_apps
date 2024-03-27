// ignore_for_file: equal_keys_in_map

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_num.dart';

class PolicyModel extends Equatable {
  const PolicyModel(
      {required this.effectiveDate, required this.renewalDate, required this.policyID, required this.clientID});

  final String? effectiveDate;
  final String? renewalDate;
  final String? policyID;
  final String? clientID;

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
      effectiveDate: json['effectiveDate'],
      renewalDate: json['renewalDate'],
      policyID: json['policyID'],
      clientID: json['cleintID']);

  Map<String, dynamic> toJson() =>
      {"effectiveDate": effectiveDate, "renewalDate": renewalDate, "policyID": policyID, "clientID": clientID};

  Policy toEntity() {
    return Policy(effectiveDate: effectiveDate, renewalDate: renewalDate, policyID: policyID, clientID: clientID);
  }

  @override
  List<Object?> get props => [effectiveDate, renewalDate, policyID, clientID];
}
