// // ignore_for_file: equal_keys_in_map
//
// class ChargeDeliveryModel extends Equatable {
//   const ChargeDeliveryModel(
//       {required this.itemshortdescr_,
//         required this.itemid_,
//         required this.itemlongdescr_,
//         required this.itemprice_,
//       });
//
//   final String? itemshortdescr_;
//   final String? itemid_;
//   final String? itemlongdescr_;
//   final double? itemprice_;
//
//   factory ChargeDeliveryModel.fromJson(Map<String, dynamic> json) =>
//       ChargeDeliveryModel(
//         itemshortdescr_: json['itemshortdescr_'],
//         itemid_: json['itemid_'],
//         itemlongdescr_: json['itemlongdescr_'],
//         itemprice_: json['itemprice_'],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "itemshortdescr_": itemshortdescr_,
//     "itemid_": itemid_,
//     "itemlongdescr_": itemlongdescr_,
//     "itemprice_": itemprice_,
//   };
//
//   ChargeDelivery toEntity() {
//     return ChargeDelivery(
//       itemshortdescr_: itemshortdescr_,
//       itemid_: itemid_,
//       itemlongdescr_: itemlongdescr_,
//       itemprice_: itemprice_,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     itemprice_,
//     itemlongdescr_,
//     itemid_,
//     itemshortdescr_
//   ];
// }
