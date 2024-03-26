import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';
import '../../repository/repository.dart';

class PostProviderLocation {
  final Repository repository;

  PostProviderLocation(this.repository);

  Future<Either<Failure, List<ProviderLocation>>> execute(Map datafilter) {
    return repository.postProviderLocation(datafilter);
  }
}
