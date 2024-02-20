// abstract class OrderRemoteDataSource {
//   Future<List<CategoriesModel>>           getCategories();
//   Future<List<ListProductModel>>          getProductList(Map data);
//   Future<List<ModelDetailAddOn>>          getListDetailAddOn(Map dataaddon);
//   Future<List<ModelDetailDrink>>          getListDetailDrink(Map data);
//   Future<List<ModelDetailFries>>          getListDetailFries(Map data);
//   Future<List<ModelLoginUser>>            getListUserLogin(Map datauser);
//   Future<List<ModelDspLogin>>             getListDspLogin(Map data);
//   Future<List<ProductDetailModel>>        getProductDetail(Map data);
//   Future<List<ChargeDeliveryModel>>       getChargeDelivery(Map data);
//   Future<List<ChargeTakeawayModel>>       getChargeTakeaway(Map data);
//   Future<List<TransOrderModel>>           getTransOrder(Map data);
//   Future<List<TransAssignModel>>          getTransAssign(Map data);
//   Future<PaymentEchannelModel>            getPaymentEchannel(Map datapayment);
//   Future<PaymentBankModel>                getPaymentBank(Map datapayment);
//   Future<PaymentQRModel>                  getPaymentQR(Map datapayment);
// // Future<List<TransCondimentModel>>    getTransCondiment(Map data);
// }
//
// class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
//   static const TOKENPAY = "Basic U0ItTWlkLXNlcnZlci12MlJxRWdxMHhlM1M0UVBaM24xSy1DdGc6";
//   static const TOKEN = 'Token 42f9fe061e76a4230284f27ffc0144648d252118';
//   static const BASE_URL = 'https://microsite.carlsjr.id/api/order';
//   static const BASE_LOGIN = 'https://demo.carlsjr.id/api/main/';
//
//   final http.Client client;
//
//   OrderRemoteDataSourceImpl({required this.client});
//
//
//   @override
//   Future<List<CategoriesModel>> getCategories() async {
//     final response =
//     await client.get(Uri.parse('$BASE_URL/menu_category'), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': TOKEN,
//     });
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return CategoriesResponse
//           .fromJson(json.decode(response.body))
//           .CategoriesList;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ListProductModel>> getProductList(Map data) async {
//     final response = await client.post(Uri.parse('$BASE_URL/get_product'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return ProductListResponse
//           .fromJson(json.decode(response.body))
//           .ProductList;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ModelDetailAddOn>> getListDetailAddOn(Map dataaddon) async {
//     final response = await client.post(Uri.parse('$BASE_URL/addon'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(dataaddon));
//     if (kDebugMode) {
//       print('response data addon');
//       print(jsonEncode(dataaddon));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return DetailAddOnResponse
//           .fromJson(json.decode(response.body))
//           .DetailAddOn;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ModelDetailDrink>> getListDetailDrink(Map data) async {
//     final response = await client.post(Uri.parse('$BASE_URL/drink'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response data drink');
//       print(jsonEncode(data));
//     }
//
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return DetailDrinkResponse
//           .fromJson(json.decode(response.body))
//           .DetailDrink;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ModelDetailFries>> getListDetailFries(Map data) async {
//     final response = await client.post(Uri.parse('$BASE_URL/fries'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response data fries');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return DetailFriesResponse
//           .fromJson(json.decode(response.body))
//           .DetailFries;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ModelLoginUser>> getListUserLogin(Map datauser) async {
//     // TODO: implement getListUserLogin
//     final response = await client.post(Uri.parse('$BASE_LOGIN/login'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(datauser));
//     if (kDebugMode) {
//       print('response data local user');
//       print("test " + jsonEncode(datauser));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print("test2 " + json.decode(response.body).toString());
//         print(json.decode(response.body).toString());
//       }
//       return LoginUserResponse
//           .fromJson(json.decode(response.body))
//           .LoginUser;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ModelDspLogin>> getListDspLogin(Map data) async {
//     // TODO: implement getListUserLogin
//     final response = await client.post(Uri.parse('$BASE_LOGIN/logindsp'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response data google user');
//       print(response.body.toString());
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return DspLoginResponse
//           .fromJson(json.decode(response.body))
//           .LoginUser;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ProductDetailModel>> getProductDetail(Map data) async {
//     // TODO: implement getProductDetail
//     final response = await client.post(Uri.parse('$BASE_URL/getproductdetail'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return ProductDetailResponse
//           .fromJson(json.decode(response.body))
//           .ProductDetail;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ChargeDeliveryModel>> getChargeDelivery(Map data) async {
//     // TODO: implement getChargeDelivery
//     final response = await client.post(Uri.parse('$BASE_URL/deliverycharge'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return ChargeDeliveryResponse
//           .fromJson(json.decode(response.body))
//           .ChargeDelivery;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<ChargeTakeawayModel>> getChargeTakeaway(Map data) async {
//     // TODO: implement getChargeTakeaway
//     final response = await client.post(Uri.parse('$BASE_URL/deliverycharge'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return ChargeTakeawayResponse
//           .fromJson(json.decode(response.body))
//           .ChargeTakeaway;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<TransOrderModel>> getTransOrder(Map data) async {
//     // TODO: implement getTransOrder
//     final response = await client.post(Uri.parse('$BASE_URL/savetransorder'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return TransOrderResponse
//           .fromJson(json.decode(response.body))
//           .TransOrder;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<List<TransAssignModel>> getTransAssign(Map data) async {
//     // TODO: implement getTransAssign
//     final response = await client.post(Uri.parse('$BASE_URL/savetransassign'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKEN,
//         },
//         body: jsonEncode(data));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(data));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return TransAssignResponse
//           .fromJson(json.decode(response.body))
//           .TransAssign;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<PaymentEchannelModel> getPaymentEchannel(Map datapayment) async {
//     // TODO: implement getPaymentEchannel
//     final response = await client.post(Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKENPAY,
//         },
//         body: utf8.encode(jsonEncode(datapayment)));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(datapayment));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return PaymentEchannelResponse
//           .fromJson(json.decode(response.body))
//           .PaymentEchannel;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<PaymentBankModel> getPaymentBank(Map datapayment) async {
//     // TODO: implement getPaymentBank
//     final response = await client.post(Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKENPAY,
//         },
//         body: utf8.encode(jsonEncode(datapayment)));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(datapayment));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return PaymentBankResponse
//           .fromJson(json.decode(response.body))
//           .PaymentBank;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//   @override
//   Future<PaymentQRModel> getPaymentQR(Map datapayment) async {
//     // TODO: implement getPaymentQR
//     final response = await client.post(Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': TOKENPAY,
//         },
//         body: utf8.encode(jsonEncode(datapayment)));
//     if (kDebugMode) {
//       print('response');
//       print(jsonEncode(datapayment));
//     }
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(json.decode(response.body).toString());
//       }
//       return PaymentQRResponse
//           .fromJson(json.decode(response.body))
//           .PaymentQR;
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//       throw ServerException();
//     }
//   }
//
//
// }