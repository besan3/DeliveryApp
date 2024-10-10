import 'package:delivery/features/auth/data/remote/model/user_model.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';

class LoginModel extends LoginEntity{
  const LoginModel({
    required super.token, required super.user});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        token: json['token'],
        user: UserModel.fromJson(json['user'])
    );
  }

  }

  class DriverLoginModel extends DriverLoginEntity{
    const DriverLoginModel({
      required super.token, required super.driver});
    factory DriverLoginModel.fromJson(Map<String, dynamic> json) {
      return DriverLoginModel(
          token: json['token'],
          driver: DriverModel.fromJson(json['driver'])
      );
    }
  }