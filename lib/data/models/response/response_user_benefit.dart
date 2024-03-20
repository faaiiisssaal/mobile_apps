// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/data/models/model_user_benefit.dart';

class BenefitUserResponse extends Equatable {
  final List<BenefitUserModel> BenefitUser;

  const BenefitUserResponse({required this.BenefitUser});

  factory BenefitUserResponse.fromJson(Map<String, dynamic> json) =>
      BenefitUserResponse(
        BenefitUser: List<BenefitUserModel>.from((json["data"]["result"] as List)
            .map((x) => BenefitUserModel.fromJson(x))
            .where((element) => element.benefitID != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(BenefitUser.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [BenefitUser];
}
