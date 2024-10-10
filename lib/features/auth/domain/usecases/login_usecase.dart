import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';
import 'package:delivery/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase{
  final AuthRepository authRepository;
  const LoginUseCase({required this.authRepository});

  Future<Either<Failure,LoginEntity>> call(String email, String password) async{
    return await authRepository.login(email, password);
  }
}