import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/provider_location.dart';
import '../../repository/repository.dart';

class GetProviderLocation {
  final Repository repository;

  GetProviderLocation(this.repository);

  Future<Either<Failure, List<ProviderLocation>>> execute() {
    return repository.getProviderLocation();
  }
}
