import 'package:dartz/dartz.dart';

import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:healthcareapp/domain/entities/peserta/login_user.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_area.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';
import 'package:healthcareapp/domain/entities/peserta/user_family.dart';

abstract class Repository {
  Future<Either<Failure, List<ProviderLocation>>>        postProviderLocation(Map datafilter);
  Future<Either<Failure, List<ProviderArea>>>            getProviderArea();

  Future<Either<Failure, List<LoginUser>>>               postLoginUser(Map datalogin);
  Future<Either<Failure, List<BenefitUser>>>             postBenefitUser(Map databenefit);
  Future<Either<Failure, List<FamilyUser>>>              postFamilyUser(Map datafamily);
}