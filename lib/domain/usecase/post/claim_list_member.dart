import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_list.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostClaimListUser {
  final Repository repository;

  PostClaimListUser(this.repository);

  Future<Either<Failure, List<ClaimListUser>>> execute(Map dataclaimlist) {
    return repository.postClaimListUser(dataclaimlist);
  }
}
