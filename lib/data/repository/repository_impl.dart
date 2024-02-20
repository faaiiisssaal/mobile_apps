// class OrderRepositoryImpl implements OrderRepository {
//   final OrderRemoteDataSource remoteDataSource;
//
//   OrderRepositoryImpl({required this.remoteDataSource});
//
//   @override
//   Future<Either<Failure, List<Categories>>> getCategories() async {
//     // TODO: implement getListproduct
//     try {
//       final result = await remoteDataSource.getCategories();
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<ListProduct>>> getListproduct(Map data) async {
//     // TODO: implement getListproduct
//     try {
//       final result = await remoteDataSource.getProductList(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<DetailAddOn>>> getListDetailAddOn(Map dataaddon) async {
//     // TODO: implement getListDetailAddOn
//     try {
//       final result = await remoteDataSource.getListDetailAddOn(dataaddon);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<DetailDrink>>> getListDetailDrink(Map data) async {
//     // TODO: implement getListDetailDrink
//     try {
//       final result = await remoteDataSource.getListDetailDrink(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<DetailFries>>> getListDetailFries(Map data) async {
//     // TODO: implement getListDetailFries
//     try {
//       final result = await remoteDataSource.getListDetailFries(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<LoginUser>>> getListLoginUser(Map datauser) async {
//     // TODO: implement getListUserLogin
//     try {
//       final result = await remoteDataSource.getListUserLogin(datauser);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<DspLogin>>> getListDspLogin(Map data) async{
//     try {
//       final result = await remoteDataSource.getListDspLogin(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<ProductDetail>>> getProductDetail(Map data) async {
//     // TODO: implement getProductDetail
//     try {
//       final result = await remoteDataSource.getProductDetail(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<ChargeDelivery>>> getChargeDelivery(Map data) async {
//     // TODO: implement getChargeDelivery
//     try {
//       final result = await remoteDataSource.getChargeDelivery(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<ChargeTakeaway>>> getChargeTakeaway(Map data) async {
//     // TODO: implement getChargeTakeaway
//     try {
//       final result = await remoteDataSource.getChargeTakeaway(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<TransOrder>>> getTransOrder(Map data) async {
//     // TODO: implement getTransOrder
//     try {
//       final result = await remoteDataSource.getTransOrder(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<TransAssign>>> getTransAssign(Map data) async {
//     // TODO: implement getTransAssign
//     try {
//       final result = await remoteDataSource.getTransAssign(data);
//       return Right(result.map((model) => model.toEntity()).toList());
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, PaymentEchannel>> getPaymentEchannel(Map datapayment) async {
//     // TODO: implement getPaymentEchannel
//     try {
//       final result = await remoteDataSource.getPaymentEchannel(datapayment);
//       return Right(PaymentEchannel(
//           status_code: result.status_code,
//           status_message: result.status_message,
//           transaction_id: result.transaction_id,
//           order_id: result.order_id,
//           merchant_id: result.merchant_id,
//           gross_amount: result.gross_amount,
//           currency: result.currency,
//           payment_type: result.payment_type,
//           transaction_time: result.transaction_time,
//           transaction_status: result.transaction_status,
//           fraud_status: result.fraud_status,
//           bill_key: result.bill_key,
//           biller_code: result.biller_code
//       ));
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, PaymentBank>> getPaymentBank(Map datapayment) async {
//     // TODO: implement getPaymentBank
//     try {
//       final result = await remoteDataSource.getPaymentBank(datapayment);
//       return Right(
//           PaymentBank(
//             status_code: result.status_code,
//             status_message: result.status_message,
//             transaction_id: result.transaction_id,
//             order_id: result.order_id,
//             merchant_id: result.merchant_id,
//             gross_amount: result.gross_amount,
//             currency: result.currency,
//             payment_type: result.payment_type,
//             transaction_status: result.transaction_status,
//             transaction_time: result.transaction_time,
//             va_number: result.va_number,
//             fraud_status: result.fraud_status,
//           )
//       );
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, PaymentQR>> getPaymentQR(Map datapayment) async {
//     // TODO: implement getPaymentQR
//     try {
//       final result = await remoteDataSource.getPaymentQR(datapayment);
//       return Right(
//           PaymentQR(
//               status_code: result.status_code,
//               status_message: result.status_message,
//               transaction_id: result.transaction_id,
//               order_id: result.order_id,
//               merchant_id: result.merchant_id,
//               gross_amount: result.gross_amount,
//               currency: result.currency,
//               payment_type: result.payment_type,
//               transaction_status: result.transaction_status,
//               transaction_time: result.transaction_time,
//               fraud_status: result.fraud_status,
//               actions: result.actions
//             // actions: result.actions,
//           )
//       );
//     } on ServerException {
//       return const Left(ServerFailure(''));
//     } on SocketException {
//       return const Left(ConnectionFailure('Failed to connect to the network'));
//     } catch (e) {
//       return Left(CommonFailure(e.toString()));
//     }
//   }
//
// // @override
// // Future<Either<Failure, List<TransCondiment>>> getTransCondiment(Map data) async {
// //   // TODO: implement getTransCondiment
// //   try {
// //     final result = await remoteDataSource.getTransCondiment(data);
// //     return Right(result.map((model) => model.toEntity()).toList());
// //   } on ServerException {
// //     return const Left(ServerFailure(''));
// //   } on SocketException {
// //     return const Left(ConnectionFailure('Failed to connect to the network'));
// //   } catch (e) {
// //     return Left(CommonFailure(e.toString()));
// //   }
// // }
//
// }