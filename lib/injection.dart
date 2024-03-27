import 'package:healthcareapp/domain/usecase/get/provider_area.dart';
import 'package:healthcareapp/domain/usecase/post/claim_info.dart';
import 'package:healthcareapp/domain/usecase/post/claim_list_member.dart';
import 'package:healthcareapp/domain/usecase/post/policy_check.dart';
import 'package:healthcareapp/domain/usecase/post/policy_num.dart';
import 'package:healthcareapp/domain/usecase/post/provider_loc.dart';
import 'package:healthcareapp/domain/usecase/post/benefit_user.dart';
import 'package:healthcareapp/domain/usecase/post/family_user.dart';
import 'package:healthcareapp/presentation/cubit/claim_info_cubit.dart';
import 'package:healthcareapp/presentation/cubit/claim_list_cubit.dart';
import 'package:healthcareapp/presentation/cubit/login_user_cubit.dart';
import 'package:healthcareapp/presentation/cubit/policy_check_cubit.dart';
import 'package:healthcareapp/presentation/cubit/policy_num_cubit.dart';
import 'package:healthcareapp/presentation/cubit/provider_area_cubit.dart';
import 'package:healthcareapp/presentation/cubit/provider_location_cubit.dart';
import 'package:healthcareapp/data/data_sources/remote_data_source.dart';
import 'package:healthcareapp/data/repository/repository_impl.dart';
import 'package:healthcareapp/domain/repository/repository.dart';
import 'package:healthcareapp/domain/usecase/post/post_login_user.dart';
import 'package:healthcareapp/presentation/cubit/user_benefit_cubit.dart';
import 'package:healthcareapp/presentation/cubit/user_family_cubit.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';



final locator = GetIt.instance;

void init() {

  // GET SECTION
  locator.registerFactory(() => ProviderLocationCubit(postProviderLocation: locator(),));
  locator.registerFactory(() => ProviderAreaCubit(getProviderArea: locator(),));

  locator.registerLazySingleton(() => PostProviderLocation(locator()));
  locator.registerLazySingleton(() => GetProviderArea(locator()));


  // POST SECTION
  locator.registerFactory(() => LoginUserCubit(postLoginUser: locator(),));
  locator.registerFactory(() => FamilyUserCubit(postFamilyUser: locator(),));
  locator.registerFactory(() => BenefitUserCubit(postBenefitUser: locator(),));
  locator.registerFactory(() => ClaimListUserCubit(postClaimListUser: locator(),));
  locator.registerFactory(() => ClaimInfoUserCubit(postClaimInfoUser: locator(),));
  locator.registerFactory(() => PolicyCubit(postPolicy: locator(),));
  locator.registerFactory(() => PolicyCheckCubit(postPolicyCheck: locator(),));

  locator.registerLazySingleton(() => PostLoginUser(locator()));
  locator.registerLazySingleton(() => PostFamilyUser(locator()));
  locator.registerLazySingleton(() => PostBenefitUser(locator()));
  locator.registerLazySingleton(() => PostClaimListUser(locator()));
  locator.registerLazySingleton(() => PostClaimInfoUser(locator()));
  locator.registerLazySingleton(() => PostPolicy(locator()));
  locator.registerLazySingleton(() => PostPolicyCheck(locator()));



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