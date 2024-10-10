import 'package:delivery/core/errors/exceptions.dart';
import 'package:delivery/features/auth/data/remote/model/login_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/network/local_storage.dart';

abstract class AuthRemoteDataSource{
  Future<LoginModel>login(String email, String password);
  Future<DriverLoginModel>driverLogin(String driver_No, String password);
}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final Dio dio;
  const AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<LoginModel> login(String email, String password) async{
    var response =
    await dio.post('https://mahmoudalbatran.com/api/auth/users', data: {'email': email,'password': password},

    );
    if (response.statusCode == 201) {
      LoginModel loginModel = LoginModel.fromJson(response.data);
      SharedPrefs.saveData(key: 'token', value: loginModel.token);
      SharedPrefs.saveData(key: 'name', value: loginModel.user.name);
      SharedPrefs.saveData(key: 'email', value: loginModel.user.email);
      return loginModel;
    }
     else {
       throw ServerException();
    }
  }

  @override
  Future<DriverLoginModel> driverLogin(String driver_No, String password) async{
    var response =
    await dio.post('https://mahmoudalbatran.com/api/auth/drivers', data: {'driver_No': driver_No,'password': password},

    );
   if (response.statusCode == 201) {
    DriverLoginModel loginModel = DriverLoginModel.fromJson(response.data);
SharedPrefs.saveData(key: 'driver_token', value: loginModel.token);
SharedPrefs.saveData(key: 'driver_name', value: loginModel.driver.name);
SharedPrefs.saveData(key: 'Car_type', value: loginModel.driver.Car_type);
SharedPrefs.saveData(key: 'driver_No', value: loginModel.driver.driver_No);

    return loginModel;
   }

   else{
     throw ServerException();
   }
  }

}