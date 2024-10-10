import 'package:delivery/core/network/network_info.dart';
import 'package:delivery/features/auth/data/remote/data_sources/auth_remote_data_source.dart';
import 'package:delivery/features/auth/data/repository/auth_repositoryImp.dart';
import 'package:delivery/features/auth/domain/repository/auth_repository.dart';
import 'package:delivery/features/auth/domain/usecases/driver_login_usecase.dart';
import 'package:delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:delivery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery/features/home/data/data_source/home_remote_data_source.dart';
import 'package:delivery/features/home/data/repository/home_repositoryImp.dart';
import 'package:delivery/features/home/domain/repository/home_reposirory.dart';
import 'package:delivery/features/home/domain/usecases/add_order_usecase.dart';
import 'package:delivery/features/home/domain/usecases/show_orders_usecase.dart';
import 'package:delivery/features/home/domain/usecases/show_staff_orders_usecase.dart';
import 'package:delivery/features/home/presentation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



final sl = GetIt.instance;

Future<void> init() async {

  /// Bloc

  sl.registerFactory(() => AuthBloc(loginUseCase: sl(),driverLoginUseCase: sl()));
  sl.registerFactory(() => HomeBloc(addOrderUseCase: sl(),showOrdersUsecase: sl(),showStaffOrdersUsecase: sl()));

  /// UseCases
  ///
 sl.registerLazySingleton(() => LoginUseCase( authRepository: sl()));
 sl.registerLazySingleton(() => DriverLoginUseCase( authRepository: sl()));
 sl.registerLazySingleton(() => AddOrderUseCase( homeRepository: sl()));
 sl.registerLazySingleton(() => ShowOrdersUsecase( homeRepository: sl()));
 sl.registerLazySingleton(() => ShowStaffOrdersUsecase( homeRepository: sl()));


/// Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));


///  DataSources

  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dio: sl(),));
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(dio: sl(),));

///! Core

 sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp( connectionChecker: sl(),));


///! External


  final dio = Dio();
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
