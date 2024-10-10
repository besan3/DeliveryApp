part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthSuccessState extends AuthState {
  final LoginEntity loginEntity;

  @override
  List<Object> get props => [loginEntity];

  const AuthSuccessState({
    required this.loginEntity,
  });
}
class DriverAuthSuccessState extends AuthState {
  final DriverLoginEntity loginEntity;

  @override
  List<Object> get props => [loginEntity];

  const DriverAuthSuccessState({
    required this.loginEntity,
  });
}

class AuthErrorState extends AuthState {
  final String message;

  @override
  List<Object> get props => [message];

  const AuthErrorState({
    required this.message,
  });
}

class UserTypeSelected extends AuthState {
  final String userType;

  const UserTypeSelected({required this.userType});

  @override
  List<Object?> get props => [userType];
}
