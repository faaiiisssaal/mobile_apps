// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/data/models/model_login_user.dart';

class ProviderLocationResponse extends Equatable {
  final List<ProviderLocationModel> ProviderLocation;

  const ProviderLocationResponse({required this.ProviderLocation});

  factory ProviderLocationResponse.fromJson(Map<String, dynamic> json) =>
      ProviderLocationResponse(
        ProviderLocation: List<ProviderLocationModel>.from((json["result"] as List)
            .map((x) => ProviderLocationModel.fromJson(x))
            .where((element) => element.area != null)),
      );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(ProviderLocation.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ProviderLocation];
}
