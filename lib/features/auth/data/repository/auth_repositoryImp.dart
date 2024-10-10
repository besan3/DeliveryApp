
import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/core/network/network_info.dart';
import 'package:delivery/features/auth/data/remote/data_sources/auth_remote_data_source.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';
import 'package:delivery/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {
        required this.authRemoteDataSource,
        required this.networkInfo
      });
  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password) async{
    if (await networkInfo.isConnected) {
      try {

        final response =
        await authRemoteDataSource.login(email, password);

        return Right(response);
      } on DioException catch(e){
        return Left(FirebaseFailure(errorMessage: '${e.response?.data['message'].toString()}'));
      }
    }

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, DriverLoginEntity>> driverLogin(String driver_No, String password) async{
    if (await networkInfo.isConnected) {
      try {

        final response =
        await authRemoteDataSource.driverLogin(driver_No, password);

        return Right(response);
      } on DioException catch(e){
        return Left(FirebaseFailure(errorMessage: '${e.response?.data['message'].toString()}'));


      }
    }

    return Left(ConnectionFailure());
  }
  
}