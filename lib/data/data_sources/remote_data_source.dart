import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:helathcareapp/data/models/model_login_user.dart';

import 'package:helathcareapp/common/exception.dart';
import 'package:helathcareapp/data/models/response/response_login_user.dart';

abstract class OrderRemoteDataSource {
  Future<List<ProviderLocationModel>>           getProviderLocation(Map data);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {

  final http.Client client;

  OrderRemoteDataSourceImpl({required this.client});

  static const baseURL = 'https://192.168.60.10:1433/src/model';

  @override
  Future<List<ProviderLocationModel>> getProviderLocation(Map data) async {
    final response = await client.post(Uri.parse('$baseURL/get_product'),
        body: jsonEncode(data));
    if (kDebugMode) {
      print('response');
      print(jsonEncode(data));
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(json.decode(response.body).toString());
      }
      return ProviderLocationResponse
          .fromJson(json.decode(response.body))
          .ProviderLocation;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      throw ServerException();
    }
  }
}