import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/repository/auth_repository.dart';

class DriverLoginUseCase{
  final AuthRepository authRepository;
  const DriverLoginUseCase({required this.authRepository});

  Future<Either<Failure,DriverLoginEntity>> call(String driver_No, String password) async{
    return await authRepository.driverLogin(driver_No, password);
  }
}