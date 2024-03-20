import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:helathcareapp/domain/repository/repository.dart';

class PostBenefitUser {
  final Repository repository;

  PostBenefitUser(this.repository);

  Future<Either<Failure, List<BenefitUser>>> execute(Map databenefit) {
    return repository.postBenefitUser(databenefit);
  }
}
