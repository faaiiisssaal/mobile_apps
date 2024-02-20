import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:helathcareapp/data/models/model_provider_location.dart';

import 'package:helathcareapp/common/exception.dart';
import 'package:helathcareapp/data/models/response/response_provider_location.dart';

abstract class RemoteDataSource {
  Future<List<ProviderLocationModel>>           getProviderLocation();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  static const baseURL = 'http://192.168.60.10:1433/src/model';

  @override
  Future<List<ProviderLocationModel>> getProviderLocation() async {
    final response = await client.get(Uri.parse('$baseURL/provider'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (kDebugMode) {
      print('response');
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(json.decode(response.body).toString());
      }

      final providerLocationResponse =
      ProviderLocationResponse.fromJson(json.decode(response.body));

      return providerLocationResponse.ProviderLocation;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      throw ServerException();
    }
  }
}