import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:helathcareapp/domain/entities/peserta/benefit_user.dart';
import 'package:helathcareapp/domain/entities/peserta/login_user.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_area.dart';
import 'package:helathcareapp/domain/entities/peserta/provider_location.dart';
import 'package:helathcareapp/domain/entities/peserta/user_family.dart';
import 'package:helathcareapp/domain/repository/repository.dart';
import 'package:helathcareapp/data/data_sources/remote_data_source.dart';
import 'package:helathcareapp/common/failure.dart';
import 'package:helathcareapp/common/exception.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProviderLocation>>> getProviderLocation() async {
    try {
      final result = await remoteDataSource.getProviderLocation();
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
}
