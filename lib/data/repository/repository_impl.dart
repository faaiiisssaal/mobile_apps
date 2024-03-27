import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:healthcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_info.dart';
import 'package:healthcareapp/domain/entities/peserta/claim_list.dart';
import 'package:healthcareapp/domain/entities/peserta/login_user.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_check.dart';
import 'package:healthcareapp/domain/entities/peserta/policy_num.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_area.dart';
import 'package:healthcareapp/domain/entities/peserta/provider_location.dart';
import 'package:healthcareapp/domain/entities/peserta/user_family.dart';
import 'package:healthcareapp/domain/repository/repository.dart';
import 'package:healthcareapp/data/data_sources/remote_data_source.dart';
import 'package:healthcareapp/common/failure.dart';
import 'package:healthcareapp/common/exception.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LoginUser>>> postLoginUser(Map datalogin) async {
    try {
      final result = await remoteDataSource.postLoginUser(datalogin);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BenefitUser>>> postBenefitUser(Map databenefit) async {
    try {
      final result = await remoteDataSource.postBenefitUser(databenefit);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FamilyUser>>> postFamilyUser(Map datafamily) async {
    try {
      final result = await remoteDataSource.postFamilyUser(datafamily);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProviderArea>>> getProviderArea() async {
    try {
      final result = await remoteDataSource.getProviderArea();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProviderLocation>>> postProviderLocation(Map datafilter) async {
    try {
      final result = await remoteDataSource.postProviderLocation(datafilter);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<dynamic>>> postClaimDetailUser(Map dataclaimdetail) {
  //
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, List<ClaimInfoUser>>> postClaimInfoUser(Map dataclaiminfo) async {
    try {
      final result = await remoteDataSource.postClaimInfoUser(dataclaiminfo);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClaimListUser>>> postClaimListUser(Map dataclaimlist) async {
    try {
      final result = await remoteDataSource.postClaimListUser(dataclaimlist);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Policy>>> postPolicy(Map datapolicy) async {
    try {
      final result = await remoteDataSource.postPolicy(datapolicy);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PolicyCheck>>> postPolicyCheck(Map datapolicycheck) async {
    try {
      final result = await remoteDataSource.postPolicyCheck(datapolicycheck);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to establish a connection to the network.'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
