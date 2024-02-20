// abstract class OrderRepository {
//   Future<Either<Failure, List<Categories>>>         getCategories();
//   Future<Either<Failure, List<ListProduct>>>        getListproduct(Map data);
//   Future<Either<Failure, List<DetailAddOn>>>        getListDetailAddOn(Map dataaddon);
//   Future<Either<Failure, List<DetailDrink>>>        getListDetailDrink(Map data);
//   Future<Either<Failure, List<DetailFries>>>        getListDetailFries(Map data);
//   Future<Either<Failure, List<LoginUser>>>          getListLoginUser(Map datauser);
//   Future<Either<Failure, List<DspLogin>>>           getListDspLogin(Map data);
//   Future<Either<Failure, List<ProductDetail>>>      getProductDetail(Map data);
//   Future<Either<Failure, List<ChargeDelivery>>>     getChargeDelivery(Map data);
//   Future<Either<Failure, List<ChargeTakeaway>>>     getChargeTakeaway(Map data);
//   Future<Either<Failure, List<TransOrder>>>         getTransOrder(Map data);
//   Future<Either<Failure, List<TransAssign>>>        getTransAssign(Map data);
//   Future<Either<Failure, PaymentEchannel>>          getPaymentEchannel(Map datapayment);
//   Future<Either<Failure, PaymentBank>>              getPaymentBank(Map datapayment);
//   Future<Either<Failure, PaymentQR>>                getPaymentQR(Map datapayment);
// // Future<Either<Failure, List<TransCondiment>>>     getTransCondiment(Map data);
// // Future<Either<Failure, List<TrackingOrder>>>      getTrackingOrder(Map data);
// }