import 'package:helathcareapp/domain/usecase/get_provider_loc.dart';
import 'package:helathcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:helathcareapp/data/data_sources/remote_data_source.dart';
import 'package:helathcareapp/data/repository/repository_impl.dart';
import 'package:helathcareapp/domain/repository/repository.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => ProviderLocationCubit(
    getProviderLocation: locator(),
  ));

  locator.registerLazySingleton(() => GetProviderLocation(locator()));

  locator.registerLazySingleton<Repository>(
        () => RepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: locator()));

  // helper
  // locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());

  // locator.registerLazySingleton(() => HttpSSLPinning.client);
}