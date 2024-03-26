import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostBenefitUser {
  final Repository repository;

  PostBenefitUser(this.repository);

  Future<Either<Failure, List<BenefitUser>>> execute(Map databenefit) {
    return repository.postBenefitUser(databenefit);
  }
}
