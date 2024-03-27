// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/data/models/model_policy_check.dart';

class PolicyCheckResponse extends Equatable {
  final List<PolicyCheckModel> PolicyCheck;

  const PolicyCheckResponse({required this.PolicyCheck});

  factory PolicyCheckResponse.fromJson(Map<String, dynamic> json) =>
      PolicyCheckResponse(
        PolicyCheck: List<PolicyCheckModel>.from((json["data"]["result"] as List)
            .map((x) => PolicyCheckModel.fromJson(x))
            .where((element) => element.clientID != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(PolicyCheck.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [PolicyCheck];
}
