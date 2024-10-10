import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure,LoginEntity>>login(String email,String password);
  Future<Either<Failure,DriverLoginEntity>>driverLogin(String driver_No,String password);

}