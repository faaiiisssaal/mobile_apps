// final locator = GetIt.instance;
//
// void init() {
//   // provider Web
//   locator.registerFactory(() => ListStoreCubit(
//     getListStore: locator(),
//   ));
//   locator.registerFactory(() => ListSlideshowCubit(
//     getListSlideshow: locator(),
//   ));
//   locator.registerFactory(() => ListAllOffersCubit(
//     getListAllOffers: locator(),
//   ));
//   locator.registerFactory(() => ListofferCubit(
//     getListoffer: locator(),
//   ));
//   locator.registerFactory(() => ListSigburgCubit(
//     getListSigburg: locator(),
//   ));
//   locator.registerFactory(() => ListRecMenuCubit(
//     getListRecMenu: locator(),
//   ));
//   locator.registerFactory(() => ListFamilyMenuCubit(
//     getListFamilyMenu: locator(),
//   ));
//   locator.registerFactory(() => ListCJChickCubit(
//     getListCJChick: locator(),
//   ));
//   locator.registerFactory(() => ListAllStarCubit(
//     getListAllStar: locator(),
//   ));
//   locator.registerFactory(() => ListStarBurgerCubit(
//     getListStarBurger: locator(),
//   ));
//   locator.registerFactory(() => ListDessertCubit(
//     getListDessert: locator(),
//   ));
//   locator.registerFactory(() => ListOtheroffersCubit(
//     getListOtherOffers: locator(),
//   ));
//   locator.registerFactory(() => ListChickBurgCubit(
//     getListChickBurg: locator(),
//   ));
//   locator.registerFactory(() => ListDrinkCubit(
//     getListDrink: locator(),
//   ));
//   locator.registerFactory(() => ListotherMenuCubit(
//     getListotherMenu: locator(),
//   ));
//
//   // provider order
//   locator.registerFactory(() => ListCategoriesCubit(
//     getListCategories: locator(),
//   ));
//   locator.registerFactory(() => ListProductCubit(
//     getListProduct: locator(),
//   ));
//   locator.registerFactory(() => PageDetailProductDrinkCubit(
//     getPageDetailProductDrink: locator(),
//   ));
//   locator.registerFactory(() => PageDetailProductFriesCubit(
//     getPageDetailProductFries: locator(),
//   ));
//   locator.registerFactory(() => PageDetailProductAddOnCubit(
//     getPageDetailProductAddOn: locator(),
//   ));
//   locator.registerFactory(() => PageLoginUserCubit(
//     getPageLoginUser: locator(),
//   ));
//   locator.registerFactory(() => PageDspLoginCubit(
//     getPageLoginDsp: locator(),
//   ));
//   locator.registerFactory(() => ProductDetailCubit(
//     getProductDetail:  locator(),
//   ));
//   locator.registerFactory(() => PageChargeDeliveryCubit(
//     getChargeDelivery:  locator(),
//   ));
//   locator.registerFactory(() => PageChargeTakeawayCubit(
//     getChargeTakeaway:  locator(),
//   ));
//   locator.registerFactory(() => PaymentEchannelCubit(
//     getPaymentEchannel:  locator(),
//   ));
//   locator.registerFactory(() => PaymentBankCubit(
//     getPaymentBank:  locator(),
//   ));
//   locator.registerFactory(() => PaymentQRCubit(
//     getPaymentQR:  locator(),
//   ));
//
//   // use case Web
//   locator.registerLazySingleton(() => GetListSlideshow(locator()));
//   locator.registerLazySingleton(() => GetListStore(locator()));
//   locator.registerLazySingleton(() => GetListAllOffers(locator()));
//   locator.registerLazySingleton(() => GetListoffer(locator()));
//   locator.registerLazySingleton(() => GetListSigburg(locator()));
//   locator.registerLazySingleton(() => GetListRecMenu(locator()));
//   locator.registerLazySingleton(() => GetListFamilyMenu(locator()));
//   locator.registerLazySingleton(() => GetListCJChick(locator()));
//   locator.registerLazySingleton(() => GetListAllStar(locator()));
//   locator.registerLazySingleton(() => GetListStarBurger(locator()));
//   locator.registerLazySingleton(() => GetListotheroffers(locator()));
//   locator.registerLazySingleton(() => GetListDessert(locator()));
//   locator.registerLazySingleton(() => GetListDrink(locator()));
//   locator.registerLazySingleton(() => GetListChickBurg(locator()));
//   locator.registerLazySingleton(() => GetListotherMenu(locator()));
//
//   // use case Order
//   locator.registerLazySingleton(() => GetCategoies(locator()));
//   locator.registerLazySingleton(() => GerProductlist(locator()));
//   locator.registerLazySingleton(() => GetDetailDrink(locator()));
//   locator.registerLazySingleton(() => GetDetailFries(locator()));
//   locator.registerLazySingleton(() => GetDetailAddOn(locator()));
//   locator.registerLazySingleton(() => GetLoginUser(locator()));
//   locator.registerLazySingleton(() => GetDspLogin(locator()));
//   locator.registerLazySingleton(() => GetProductDetail(locator()));
//   locator.registerLazySingleton(() => GetChargeDelivery(locator()));
//   locator.registerLazySingleton(() => GetChargeTakeaway(locator()));
//   locator.registerLazySingleton(() => GetPaymentEchannel(locator()));
//   locator.registerLazySingleton(() => GetPaymentBank(locator()));
//   locator.registerLazySingleton(() => GetPaymentQR(locator()));
//
//   // repository web
//   locator.registerLazySingleton<WebRepository>(
//         () => WebRepositoryImpl(
//       remoteDataSource: locator(),
//     ),
//   );
//
//   // repository order
//   locator.registerLazySingleton<OrderRepository>(
//         () => OrderRepositoryImpl(
//       remoteDataSource: locator(),
//     ),
//   );
//
//   // data sources web
//   locator.registerLazySingleton<WebRemoteDataSource>(
//           () => WebRemoteDataSourceImpl(client: locator()));
//
//   // data sources order
//   locator.registerLazySingleton<OrderRemoteDataSource>(
//           () => OrderRemoteDataSourceImpl(client: locator()));
//
//   // helper
//   // locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
//
//   // external
//   locator.registerLazySingleton(() => http.Client());
//
//   // locator.registerLazySingleton(() => HttpSSLPinning.client);
// }