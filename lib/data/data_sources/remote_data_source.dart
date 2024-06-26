import 'dart:convert';
import 'package:healthcareapp/data/models/mode_claim_info.dart';
import 'package:healthcareapp/data/models/model_claim_list.dart';
import 'package:healthcareapp/data/models/model_policy_check.dart';
import 'package:healthcareapp/data/models/model_policy_num.dart';
import 'package:healthcareapp/data/models/model_provider_area.dart';
import 'package:healthcareapp/data/models/model_user_benefit.dart';
import 'package:healthcareapp/data/models/model_user_family.dart';
import 'package:healthcareapp/data/models/response/response_claim_info.dart';
import 'package:healthcareapp/data/models/response/response_claim_list.dart';
import 'package:healthcareapp/data/models/response/response_policy_check.dart';
import 'package:healthcareapp/data/models/response/response_policy_num.dart';
import 'package:healthcareapp/data/models/response/response_provider_area.dart';
import 'package:healthcareapp/data/models/response/response_user_benefit.dart';
import 'package:healthcareapp/data/models/response/response_user_family.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:healthcareapp/data/models/model_provider_location.dart';
import 'package:healthcareapp/common/exception.dart';
import 'package:healthcareapp/data/models/response/response_provider_location.dart';
import 'package:healthcareapp/data/models/model_login_user.dart';
import 'package:healthcareapp/data/models/response/response_login_user.dart';

abstract class RemoteDataSource {
  Future<List<ProviderLocationModel>>         postProviderLocation(Map datafilter);
  Future<List<ProviderAreaModel>>             getProviderArea();
  Future<List<LoginUserModel>>                postLoginUser(Map datalogin);
  Future<List<FamilyUserModel>>               postFamilyUser(Map datafamily);
  Future<List<PolicyModel>>                   postPolicy(Map datapolicy);
  Future<List<PolicyCheckModel>>              postPolicyCheck(Map datapolicycheck);
  Future<List<BenefitUserModel>>              postBenefitUser(Map databenefit);
  Future<List<ClaimInfoUserModel>>            postClaimInfoUser(Map dataclaiminfo);
  Future<List<ClaimListUserModel>>            postClaimListUser(Map dataclaimlist);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseURL = 'https://4437-139-194-214-128.ngrok-free.app/src/model';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProviderLocationModel>> postProviderLocation(Map datafilter) async {
    final response = await client.post(
      Uri.parse('$baseURL/provider'),
      body: jsonEncode(datafilter), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
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
  Future<List<ProviderAreaModel>> getProviderArea() async {
    final response = await client.get(Uri.parse('$baseURL/area'));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
      }
      return ProviderAreaResponse.fromJson(json.decode(response.body)).ProviderArea;
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

  @override
  Future<List<ClaimInfoUserModel>> postClaimInfoUser(Map dataclaiminfo) async {
    final response = await client.post(
      Uri.parse('$baseURL/benefituser'),
      body: jsonEncode(dataclaiminfo), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return ClaimInfoUserResponse.fromJson(json.decode(response.body)).ClaimInfoUser;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }

  @override
  Future<List<ClaimListUserModel>> postClaimListUser(Map dataclaimlist) async {
    final response = await client.post(
      Uri.parse('$baseURL/benefituser'),
      body: jsonEncode(dataclaimlist), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return ClaimListUserResponse.fromJson(json.decode(response.body)).ClaimListUser;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }

  @override
  Future<List<PolicyModel>> postPolicy(Map datapolicy) async {
    final response = await client.post(
      Uri.parse('$baseURL/policysort'),
      body: jsonEncode(datapolicy), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return PolicyResponse.fromJson(json.decode(response.body)).Policy;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }

  @override
  Future<List<PolicyCheckModel>> postPolicyCheck(Map datapolicycheck) async {
    final response = await client.post(
      Uri.parse('$baseURL/policysort'),
      body: jsonEncode(datapolicycheck), // Encode your .... map to JSON format
      headers: {
        'Content-Type': 'application/json', // Specify the content type as JSON
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Response Body: ${json.decode(response.body)}");
        print('Response status code: ${response.statusCode}');
      }
      return PolicyCheckResponse.fromJson(json.decode(response.body)).PolicyCheck;
    } else {
      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      throw ServerException();
    }
  }
}
