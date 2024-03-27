// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/data/models/model_policy_num.dart';

class PolicyResponse extends Equatable {
  final List<PolicyModel> Policy;

  const PolicyResponse({required this.Policy});

  factory PolicyResponse.fromJson(Map<String, dynamic> json) =>
      PolicyResponse(
        Policy: List<PolicyModel>.from((json["data"]["result"] as List)
            .map((x) => PolicyModel.fromJson(x))
            .where((element) => element.clientID != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(Policy.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [Policy];
}
