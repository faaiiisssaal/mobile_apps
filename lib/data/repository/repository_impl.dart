import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:helathcareapp/domain/entities/login_user.dart';
import 'package:helathcareapp/domain/repository/repository.dart';
import 'package:helathcareapp/data/data_sources/remote_data_source.dart';

import 'package:helathcareapp/common/failure.dart';

import '../../common/exception.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProviderLocation>>> getProviderLocation(Map data) async {
    // TODO: implement getListproduct
    try {
      final result = await remoteDataSource.getProviderLocation(data);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}