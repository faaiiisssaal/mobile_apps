// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/data/models/mode_claim_info.dart';

class ClaimInfoUserResponse extends Equatable {
  final List<ClaimInfoUserModel> ClaimInfoUser;

  const ClaimInfoUserResponse({required this.ClaimInfoUser});

  factory ClaimInfoUserResponse.fromJson(Map<String, dynamic> json) =>
      ClaimInfoUserResponse(
        ClaimInfoUser: List<ClaimInfoUserModel>.from((json["data"]["result"] as List)
            .map((x) => ClaimInfoUserModel.fromJson(x))
            .where((element) => element.cno != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(ClaimInfoUser.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ClaimInfoUser];
}
