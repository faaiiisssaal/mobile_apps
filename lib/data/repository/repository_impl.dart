import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:helathcareapp/domain/entities/login_user.dart';

import 'package:helathcareapp/domain/entities/provider_location.dart';
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
}

