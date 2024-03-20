import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/peserta/user_family.dart';
import 'package:helathcareapp/domain/repository/repository.dart';

class PostFamilyUser {
  final Repository repository;

  PostFamilyUser(this.repository);

  Future<Either<Failure, List<FamilyUser>>> execute(Map datafamily) {
    return repository.postFamilyUser(datafamily);
  }
}
