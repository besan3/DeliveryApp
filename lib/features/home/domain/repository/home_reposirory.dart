import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/home/domain/entites/add_order_entity.dart';
import 'package:delivery/features/home/domain/entites/order_entity.dart';

abstract class HomeRepository{
  Future<Either<Failure,AddOrderEntity>>addOrder(String date,String description_one,String staff_names);
  Future<Either<Failure,OrderEntity>>showOrders(String start_at,String end_at);
  Future<Either<Failure,OrderEntity>>showStaffOrders(String start_at,String end_at);

}