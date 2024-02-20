import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<ProviderLocation>>>        getProviderLocation(Map data);
}