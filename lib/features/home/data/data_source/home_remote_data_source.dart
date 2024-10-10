import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/home/data/model/add_order_model.dart';
import 'package:delivery/features/home/data/model/orders_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/local_storage.dart';

abstract class HomeRemoteDataSource {
  Future<AddOrderModel>addOrder(String date,String description_one,String staff_names);
  Future<OrderModel>showOrders(String start_at,String end_at);
  Future<OrderModel>showStaffOrders(String start_at,String end_at);
}
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final Dio dio;
  const HomeRemoteDataSourceImpl({required this.dio});
  @override
  Future<AddOrderModel> addOrder(String date, String description_one, String staff_names) async{
    var response =
        await dio.post('https://mahmoudalbatran.com/api/orders/store',
           data: {
          'date':date,
             'staff_names':staff_names,
             'description_one':description_one
           },
            options: Options(
                headers: {
                  'Authorization':'Bearer ${SharedPrefs.getString('driver_token')}'
                }
            )
        );
   if (response.statusCode==201) {
    AddOrderModel addOrderModel = AddOrderModel.fromJson(response.data);
    return addOrderModel;
  }

     else{
       throw ServerFailure();
    }
  }

  @override
  Future<OrderModel> showOrders(String start_at, String end_at)async {
    var response =
    await dio.post('https://mahmoudalbatran.com/api/orders/filterDriver',
        data: {
        'start_at':start_at,
        'end_at':end_at,
        },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs.getString('driver_token')}'
            }
        )
    );
  if (response.statusCode==200) {
    OrderModel orderModel = OrderModel.fromJson(response.data);
    return orderModel;
  }

  else{
    throw ServerFailure();
  }
  }

  @override
  Future<OrderModel> showStaffOrders(String start_at, String end_at) async{
    var response =
    await dio.post('https://mahmoudalbatran.com/api/orders/filterStaff',
        data: {
          'start_at':start_at,
          'end_at':end_at,
        },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs.getString('token')}'
            }
        )
    );
    if (response.statusCode==200) {
      OrderModel orderModel = OrderModel.fromJson(response.data);
      return orderModel;
    }

    else{
      throw ServerFailure();
    }
  }

}