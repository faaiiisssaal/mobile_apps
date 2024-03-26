import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_area.dart';
import '../../repository/repository.dart';

class GetProviderArea {
  final Repository repository;

  GetProviderArea(this.repository);

  Future<Either<Failure, List<ProviderArea>>> execute() {
    return repository.getProviderArea();
  }
}
