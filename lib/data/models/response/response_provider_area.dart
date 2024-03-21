// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:helathcareapp/data/models/model_provider_area.dart';

class ProviderAreaResponse extends Equatable {
  final List<ProviderAreaModel> ProviderArea;

  const ProviderAreaResponse({required this.ProviderArea});

  factory ProviderAreaResponse.fromJson(Map<String, dynamic> json) =>
      ProviderAreaResponse(
        ProviderArea: List<ProviderAreaModel>.from((json["data"]["result"] as List)
            .map((x) => ProviderAreaModel.fromJson(x))
            .where((element) => element.area != null)),
      );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(ProviderArea.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ProviderArea];
}
