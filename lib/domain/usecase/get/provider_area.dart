import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_area.dart';
import '../../repository/repository.dart';

class GetProviderArea {
  final Repository repository;

  GetProviderArea(this.repository);

  Future<Either<Failure, List<ProviderArea>>> execute() {
    return repository.getProviderArea();
  }
}
