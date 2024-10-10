part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}
class LoginEvent extends AuthEvent {

  final String email;
  final String password;

  const LoginEvent({

    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email,password];
}
class DriverLoginEvent extends AuthEvent {

  final String driver_No;
  final String password;

  const DriverLoginEvent({

    required this.driver_No,
    required this.password,
  });

  @override
  List<Object?> get props => [driver_No,password];
}

class ToggleUserTypeEvent extends AuthEvent {
  final String userType;

  const ToggleUserTypeEvent({required this.userType});

  @override
  List<Object?> get props => [userType];
}
