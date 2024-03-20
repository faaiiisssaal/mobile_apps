import 'dart:convert';
import 'package:helathcareapp/data/models/model_user_benefit.dart';
import 'package:helathcareapp/data/models/model_user_family.dart';
import 'package:helathcareapp/data/models/response/response_user_benefit.dart';
import 'package:helathcareapp/data/models/response/response_user_family.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:helathcareapp/data/models/model_provider_location.dart';
import 'package:helathcareapp/common/exception.dart';
import 'package:helathcareapp/data/models/response/response_provider_location.dart';
import 'package:helathcareapp/data/models/model_login_user.dart';
import 'package:helathcareapp/data/models/response/response_login_user.dart';

abstract class RemoteDataSource {
  Future<List<ProviderLocationModel>>         getProviderLocation();
  Future<List<LoginUserModel>>                postLoginUser(Map datalogin);
  Future<List<FamilyUserModel>>               postFamilyUser(Map datafamily);
  Future<List<BenefitUserModel>>              postBenefitUser(Map databenefit);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseURL = 'https://10e3-103-119-54-150.ngrok-free.app/src/model';

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

  @override
  Future<List<LoginUserModel>> postLoginUser(Map dataLogin) async {
    final response = await client.post(
      Uri.parse('$baseURL/user'),
      body: jsonEncode(dataLogin), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return LoginUserResponse.fromJson(json.decode(response.body)).LoginUser;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }

  @override
  Future<List<FamilyUserModel>> postFamilyUser(Map datafamily) async {
    final response = await client.post(
      Uri.parse('$baseURL/familyuser'),
      body: jsonEncode(datafamily), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return FamilyUserResponse.fromJson(json.decode(response.body)).FamilyUser;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }

  @override
  Future<List<BenefitUserModel>> postBenefitUser(Map databenefit) async {
    final response = await client.post(
      Uri.parse('$baseURL/benefituser'),
      body: jsonEncode(databenefit), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return BenefitUserResponse.fromJson(json.decode(response.body)).BenefitUser;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }
}