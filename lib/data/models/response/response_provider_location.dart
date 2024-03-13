// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/data/models/model_provider_location.dart';

class ProviderLocationResponse extends Equatable {
  final List<ProviderLocationModel> ProviderLocation;

  const ProviderLocationResponse({required this.ProviderLocation});

  factory ProviderLocationResponse.fromJson(Map<String, dynamic> json) =>
      ProviderLocationResponse(
        ProviderLocation: List<ProviderLocationModel>.from((json["data"]["result"] as List)
            .map((x) => ProviderLocationModel.fromJson(x))
            .where((element) => element.id != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(ProviderLocation.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ProviderLocation];
}
