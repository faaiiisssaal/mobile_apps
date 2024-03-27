// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/data/models/model_claim_list.dart';

class ClaimListUserResponse extends Equatable {
  final List<ClaimListUserModel> ClaimListUser;

  const ClaimListUserResponse({required this.ClaimListUser});

  factory ClaimListUserResponse.fromJson(Map<String, dynamic> json) =>
      ClaimListUserResponse(
        ClaimListUser: List<ClaimListUserModel>.from((json["data"]["result"] as List)
            .map((x) => ClaimListUserModel.fromJson(x))
            .where((element) => element.cno != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(ClaimListUser.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ClaimListUser];
}
