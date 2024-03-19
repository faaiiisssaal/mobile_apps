import 'package:dartz/dartz.dart';

import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';
import 'package:helathcareapp/domain/repository/repository.dart';

class PostLoginUser {
  final Repository repository;

  PostLoginUser(this.repository);

  Future<Either<Failure, List<LoginUser>>> execute(Map datalogin) {
    return repository.postLoginUser(datalogin);
  }
}
