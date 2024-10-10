import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();


  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }


  setTheme(String? value) {
    _sharedPrefs.setString(selectedTheme, value!);
  }

  static const String selectedTheme = "theme";

  static Future<bool> setString(String key, String value) async =>
      await _sharedPrefs.setString(key, value);


  static String? getString(String key){
    return _sharedPrefs.getString(key);
  }
  static dynamic getDta({
    required String key,
  }){
    return  _sharedPrefs.get(key);
  }
  static Future<bool> saveData({
    required String key,
    required dynamic value
  })async{

    if(value is String) return await _sharedPrefs.setString(key, value);
    if(value is int) return await _sharedPrefs.setInt(key, value);
    if(value is bool) return await _sharedPrefs.setBool(key, value);
    if(value is Map<String,dynamic>) return await _sharedPrefs.setString(key, json.encode(value));
    return await _sharedPrefs.setDouble(key, value);
  }
  static Future<bool?> removeData({
    required String key,
  })async{
    return await _sharedPrefs.remove(key);

  }
  Future<bool> saveToken(String token)async {

    return await _sharedPrefs.setString('token', token);
  }
  Future<bool> removeToken()async {

    return await _sharedPrefs.remove('token');
  }
  Future<bool> removeDriverToken()async {

    return await _sharedPrefs.remove('driver_token');
  }
  static const CACHED_USERS = "CACHED_USERS";
  static const CACHED_CARD = "CACHED_CARD";
  static const CACHED_PROFILE = "CACHED_PROFILE";
  // Future<Unit> cacheUsers(ProfileModel allUsers) {
  //   SharedPrefs.setString(CACHED_USERS, json.encode(allUsers.toJson()));
  //   return Future.value(unit);
  // }
  // Future<Unit> cacheProfile(ProfileModel allUsers) {
  //   SharedPrefs.setString(CACHED_PROFILE, json.encode(allUsers.toJson()));
  //   return Future.value(unit);
  // }
//  Future<Unit> cacheHomeData(HomeModel homeModel) {
  //   SharedPrefs.setString('homeData', json.encode(homeModel.toJson()));
  //   return Future.value(unit);
  // }
  // Future<ProfileModel> getCachedUsers() {
  //   final jsonString = SharedPrefs.getString(CACHED_USERS);
  //   if (jsonString != null) {
  //     return Future.value(ProfileModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
  // Future<HomeModel> getCachedHomeData() {
  //   final jsonString = SharedPrefs.getString('homeData');
  //   if (jsonString != null) {
  //     return Future.value(HomeModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
  static const token_key = "token";
  static const driver_token = "driver_token";
  Future<Unit> cacheLogin(String token) {
    SharedPrefs.setString(token_key,token );
    return Future.value(unit);
  }
  // Future<LoginModel> getCachedLogin() {
  //   final jsonString = SharedPrefs.getString(token_key);
  //   if (jsonString != null) {
  //     return Future.value(LoginModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
  String get theme=>_sharedPrefs.getString('theme')??'system';

  static String get token => _sharedPrefs.getString('token')??'';

}