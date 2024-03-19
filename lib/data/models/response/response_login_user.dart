// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/data/models/model_login_user.dart';

class LoginUserResponse extends Equatable {
  final List<LoginUserModel> LoginUser;

  const LoginUserResponse({required this.LoginUser});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      LoginUserResponse(
        LoginUser: List<LoginUserModel>.from((json["data"]["result"] as List)
            .map((x) => LoginUserModel.fromJson(x))
            .where((element) => element.policyNo != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(LoginUser.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [LoginUser];
}
