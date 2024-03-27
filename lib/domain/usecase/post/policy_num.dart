import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_num.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostPolicy {
  final Repository repository;

  PostPolicy(this.repository);

  Future<Either<Failure, List<Policy>>> execute(Map datapolicy) {
    return repository.postPolicy(datapolicy);
  }
}
