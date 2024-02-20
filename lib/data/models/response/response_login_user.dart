// // ignore_for_file: non_constant_identifier_names
//
// class ChargeDeliveryResponse extends Equatable {
//   final List<ChargeDeliveryModel> ChargeDelivery;
//
//   const ChargeDeliveryResponse({required this.ChargeDelivery});
//
//   factory ChargeDeliveryResponse.fromJson(Map<String, dynamic> json) =>
//       ChargeDeliveryResponse(
//         ChargeDelivery: List<ChargeDeliveryModel>.from((json["result"] as List)
//             .map((x) => ChargeDeliveryModel.fromJson(x))
//             .where((element) => element.itemid_ != null)),
//       );
//
//   Map<String, dynamic> toJson() => {
//     "results": List<dynamic>.from(ChargeDelivery.map((x) => x.toJson())),
//   };
//
//   @override
//   List<Object> get props => [ChargeDelivery];
// }
