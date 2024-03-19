import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';

abstract class Repository {
  Future<Either<Failure, List<ProviderLocation>>>        getProviderLocation();

  Future<Either<Failure, List<LoginUser>>>          postLoginUser(Map datalogin);
}