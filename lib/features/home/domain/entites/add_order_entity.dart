import 'package:equatable/equatable.dart';

class AddOrderEntity extends Equatable{
  final bool status;
  final String message;
const AddOrderEntity({required this.status, required this.message});
  @override
  List<Object?> get props => [status, message];
}