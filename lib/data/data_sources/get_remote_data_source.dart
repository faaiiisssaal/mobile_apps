import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:helathcareapp/data/models/model_provider_location.dart';

import 'package:helathcareapp/common/exception.dart';
import 'package:helathcareapp/data/models/response/response_provider_location.dart';

abstract class RemoteDataSource {
  Future<List<ProviderLocationModel>> getProviderLocation();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseURL = 'https://8761-103-119-54-150.ngrok-free.app/src/model';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProviderLocationModel>> getProviderLocation() async {
    final response = await client.get(Uri.parse('$baseURL/provider'));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
      }
      return ProviderLocationResponse.fromJson(json.decode(response.body)).ProviderLocation;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }
}
