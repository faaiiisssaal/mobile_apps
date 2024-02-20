import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';

abstract class Repository {
  Future<Either<Failure, List<ProviderLocation>>>        getProviderLocation();
}