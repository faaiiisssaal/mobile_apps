import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_check.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostPolicyCheck {
  final Repository repository;

  PostPolicyCheck(this.repository);

  Future<Either<Failure, List<PolicyCheck>>> execute(Map datapolicycheck) {
    return repository.postPolicyCheck(datapolicycheck);
  }
}
