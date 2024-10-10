import 'package:delivery/features/home/domain/entites/add_order_entity.dart';

class AddOrderModel extends AddOrderEntity{
  const AddOrderModel({required super.status, required super.message});
  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
        status: json['status'],
        message:json['message']
    );
  }
}