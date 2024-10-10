import 'package:delivery/features/home/domain/entites/order_entity.dart';

import '../../../auth/data/remote/model/user_model.dart';
class OrderModel extends OrderEntity{
  OrderModel({required super.status, required super.orderData});
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],

      orderData: (json['data'] as List<dynamic>)
          .map<OrderDataModel>((dataJson) => OrderDataModel.fromJson(dataJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
class OrderDataModel extends OrderDataEntity{
  const OrderDataModel({required super.id,required super.price, required super.date,super.teamId,super.team, required super.descriptionOne, required super.staffNames, required super.driverId, required super.createdAt, required super.updatedAt, required super.driver, required super.descriptionTwo});
  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      id: json['id']??0,
      date: json['date']??'',
      descriptionOne: json['description_one']??'',
     descriptionTwo: json['description_two']??'',
      price: json['price']??0 ,
      staffNames: json['staff_names']??'',
      driverId: json['driver_id']??0,
      teamId: json['team_id'] != null ? json['team_id'] : null,
      createdAt: json['created_at']??'',
      updatedAt: json['updated_at']??'',
      driver: (json['driver'] is Map<String, dynamic>)
          ? DriverModel.fromJson(json['driver'])
          : null,
    team: (json['team'] is Map<String, dynamic>) ? TeamModel.fromJson(json['team']) :null,
    );
  }
}

class TeamModel extends Team{
  const TeamModel({required super.id, required super.name, required super.createdAt, required super.updatedAt, required super.staffNames, required super.userId});
  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id']??0,
      name: json['name']??'',
      staffNames: json['staff_names']??'',
      userId: json['user_id']??0,
      createdAt: json['created_at']??'',
      updatedAt: json['updated_at']??'',
    );
  }

}