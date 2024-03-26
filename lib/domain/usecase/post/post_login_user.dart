import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/login_user.dart';
import 'package:healthcareapp/domain/repository/repository.dart';

class PostLoginUser {
  final Repository repository;

  PostLoginUser(this.repository);

  Future<Either<Failure, List<LoginUser>>> execute(Map datalogin) {
    return repository.postLoginUser(datalogin);
  }
}
