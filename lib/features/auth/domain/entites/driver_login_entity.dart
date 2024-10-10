import 'package:equatable/equatable.dart';

class DriverLoginEntity extends Equatable{
  final String token;
  final DriverEntity driver;
  const DriverLoginEntity({
    required this.token,required this.driver});

  @override
  List<Object?> get props => [ token, driver];

}

// User Entity
class DriverEntity extends Equatable {
  final int id;
  final String name;
  final String Car_type;
  final String password;
  final int driver_No;
  final String? profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profilePhotoUrl;

  const DriverEntity({
    required this.id,
    required this.name,
    required this.Car_type,
    required this.password,
    required this.driver_No,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });



  // Equatable overrides
  @override
  List<Object?> get props => [
    id,
    name,
    Car_type,
    password,
    driver_No,
    profilePhotoPath,
    createdAt,
    updatedAt,
    profilePhotoUrl,
  ];
}


