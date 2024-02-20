import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

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
      if (kDebugMode) {
        print('Received data from remote data source: $result');
      }

      final entityList = result.map((model) => model.toEntity()).toList();
      return Right(entityList);
    } on ServerException catch (e) {
      if (kDebugMode) {
        print('ServerException: $e');
      }
      return const Left(ServerFailure('Failed to get data from the server.'));
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: $e');
      }
      return const Left(ConnectionFailure('Failed to connect to the network.'));
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error: $e');
      }
      return Left(CommonFailure('Unexpected error: $e'));
    }
  }
}

