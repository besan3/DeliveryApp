import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  final String token;
  final UserEntity user;
  const LoginEntity({
    required this.token,required this.user});

  @override
  List<Object?> get props => [ token, user];

}

// User Entity
class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? twoFactorConfirmedAt;
  final int? currentTeamId;
  final String? profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profilePhotoUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
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
    email,
    emailVerifiedAt,
    twoFactorConfirmedAt,
    currentTeamId,
    profilePhotoPath,
    createdAt,
    updatedAt,
    profilePhotoUrl,
  ];
}


