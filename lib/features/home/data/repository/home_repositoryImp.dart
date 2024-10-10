import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/core/network/network_info.dart';
import 'package:delivery/features/home/data/data_source/home_remote_data_source.dart';
import 'package:delivery/features/home/domain/entites/add_order_entity.dart';
import 'package:delivery/features/home/domain/entites/order_entity.dart';
import 'package:delivery/features/home/domain/repository/home_reposirory.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {
        required this.homeRemoteDataSource,
        required this.networkInfo
      });
  @override
  Future<Either<Failure, AddOrderEntity>> addOrder(String date, String description_one, String staff_names) async{
    if (await networkInfo.isConnected) {
      try {

        final response =
        await homeRemoteDataSource.addOrder(date, description_one, staff_names);
        return Right(response);
      } on DioException catch(e) {
        return Left(FirebaseFailure(errorMessage: '${e.response?.data['message'].toString()}'));
      }
    }

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, OrderEntity>> showOrders(String start_at, String end_at) async{
    if (await networkInfo.isConnected) {
      try {

        final response =
        await homeRemoteDataSource.showOrders(start_at, end_at);
        return Right(response);
      } on DioException catch(e) {
        return Left(FirebaseFailure(errorMessage: '${e.response?.data.toString()}'));
      }
    }

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, OrderEntity>> showStaffOrders(String start_at, String end_at) async{
    if (await networkInfo.isConnected) {
      try {

        final response =
            await homeRemoteDataSource.showStaffOrders(start_at, end_at);
        return Right(response);
      } on DioException catch(e) {
        return Left(FirebaseFailure(errorMessage: '${e.response?.data['message'].toString()}'));
      }
    }

    return Left(ConnectionFailure());
  }

}