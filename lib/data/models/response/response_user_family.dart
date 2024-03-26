// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:healthcareapp/data/models/model_user_family.dart';

class FamilyUserResponse extends Equatable {
  final List<FamilyUserModel> FamilyUser;

  const FamilyUserResponse({required this.FamilyUser});

  factory FamilyUserResponse.fromJson(Map<String, dynamic> json) =>
      FamilyUserResponse(
        FamilyUser: List<FamilyUserModel>.from((json["data"]["result"] as List)
            .map((x) => FamilyUserModel.fromJson(x))
            .where((element) => element.memberno != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(FamilyUser.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [FamilyUser];
}
