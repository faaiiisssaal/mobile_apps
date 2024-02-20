import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';
import '../repository/repository.dart';

class GetProviderLocation {
  final OrderRepository repository;

  GetProviderLocation(this.repository);

  Future<Either<Failure, List<ProviderLocation>>> execute(Map data) {
    return repository.getProviderLocation(data);
  }
}
