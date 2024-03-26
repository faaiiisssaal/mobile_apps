import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_info.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostClaimInfoUser {
  final Repository repository;

  PostClaimInfoUser(this.repository);

  Future<Either<Failure, List<ClaimInfoUser>>> execute(Map dataclaiminfo) {
    return repository.postClaimInfoUser(dataclaiminfo);
  }
}
