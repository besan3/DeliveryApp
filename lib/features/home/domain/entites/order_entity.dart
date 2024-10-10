import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
final bool status;
 List<OrderDataEntity>? orderData;
 OrderEntity({required this.status, this.orderData});
  @override
  List<Object?> get props => [status, orderData];

}
class OrderDataEntity extends Equatable{
  final int id;
  final String date;
  final String descriptionOne;
  final String descriptionTwo;
  final int price;
  final String staffNames;
  final int driverId;
  final int? teamId;
  final String createdAt;
  final String updatedAt;
  final DriverEntity? driver;
  final Team? team;

  const OrderDataEntity( {
    required this.id,
    required this.date,
    required this.descriptionOne,
    required this.descriptionTwo,
    required this.price,
    required this.staffNames,
    required this.driverId,
    this.teamId,
    this.team,
    required this.createdAt,
    required this.updatedAt,
     this.driver,
  });

  @override
  List<Object?> get props => [id,date,descriptionOne,staffNames,driverId,teamId,createdAt,updatedAt,descriptionTwo,price];

}
class Team extends Equatable{
  final int id;
  final String name;
  final String staffNames;
  final int userId;
  final String createdAt;
  final String updatedAt;

  const Team({
    required this.id,
    required this.name,
    required this.staffNames,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [];}