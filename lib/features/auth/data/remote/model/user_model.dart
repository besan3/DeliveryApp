import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';

class UserModel extends UserEntity{
  const UserModel({required super.id,required super.name,required super.email, required super.createdAt, required super.updatedAt, required super.profilePhotoUrl,super.currentTeamId,super.emailVerifiedAt,super.profilePhotoPath,super.twoFactorConfirmedAt});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profilePhotoUrl: json['profile_photo_url'],

    );
  }
}

class DriverModel extends DriverEntity{
  const DriverModel({required super.id,required super.name,required super.Car_type, required super.createdAt, required super.updatedAt, required super.profilePhotoUrl,required super.driver_No, required super.password,});
  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      name: json['name'],
      Car_type: json['Car_type'],
      driver_No: json['driver_No'],
      password: json['password'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profilePhotoUrl: json['profile_photo_url'],

    );
  }
}