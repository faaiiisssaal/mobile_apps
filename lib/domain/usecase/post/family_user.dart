import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/user_family.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostFamilyUser {
  final Repository repository;

  PostFamilyUser(this.repository);

  Future<Either<Failure, List<FamilyUser>>> execute(Map datafamily) {
    return repository.postFamilyUser(datafamily);
  }
}
