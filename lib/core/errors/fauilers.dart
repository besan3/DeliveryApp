import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}
class ConnectionFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}
class FirebaseFailure extends Failure{
  final String errorMessage;
  FirebaseFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}


class EmptyCacheFailure extends Failure{
  @override
  List<Object?> get props => [];
}