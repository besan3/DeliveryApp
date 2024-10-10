

import 'package:bloc/bloc.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/home/domain/entites/add_order_entity.dart';
import 'package:delivery/features/home/domain/entites/order_entity.dart';
import 'package:delivery/features/home/domain/usecases/add_order_usecase.dart';
import 'package:delivery/features/home/domain/usecases/show_orders_usecase.dart';
import 'package:delivery/features/home/domain/usecases/show_staff_orders_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // alias for date formatting

import '../../../../core/errors/fauilers.dart';
import '../../../../core/network/local_storage.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddOrderUseCase addOrderUseCase;
  final ShowOrdersUsecase showOrdersUsecase;
  final ShowStaffOrdersUsecase showStaffOrdersUsecase;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController discreptionController = TextEditingController();
  final TextEditingController staffsController = TextEditingController();

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  AddOrderEntity addOrderEntity = const AddOrderEntity(status: false, message: '');
  OrderEntity orderEntity = OrderEntity(status: false, orderData: [
    OrderDataEntity(
        id: 0,
        date: '',
        descriptionOne: '',
        staffNames: '',
        driverId: 0,
        createdAt: '',
        updatedAt: '',
        driver: DriverEntity(
            id: 0,
            name: '',
            Car_type: '',
            password: '',
            driver_No: 0,
            createdAt: DateTime(0),
            updatedAt: DateTime(0),
            profilePhotoUrl: ''),
        descriptionTwo: '',
        price: 0)
  ]);

  HomeBloc(
      {required this.addOrderUseCase,
      required this.showOrdersUsecase,
      required this.showStaffOrdersUsecase})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is AddOrderEvent) {
        emit(HomeLoadingState());
        var result = await addOrderUseCase.call(
            event.date, event.description_one, event.staff_names);
        emit(result.fold(
            (l) => HomeErrorState(
                message: l is ConnectionFailure
                    ? 'يرجى التأكد من الاتصال بالانترنت'
                    : l.toString()), (r) {
          addOrderEntity = r;
          if (r.status == true) {
            return AddOrderSuccess(addOrderEntity: addOrderEntity);
          } else {
            return HomeErrorState(message: r.toString());
          }
        }));
      }

      if (event is ShowOrdersEvent) {
        emit(HomeLoadingState());
        var result = await showOrdersUsecase.call(event.start_at, event.end_at);
        emit(result.fold(
            (l) => HomeErrorState(
                message: l is ConnectionFailure
                    ? 'يرجى التأكد من الاتصال بالانترنت'
                    : 'لا يوجد طلبات لعرضها'), (r) {
          orderEntity = r;
          orderEntity.orderData = r.orderData;
          if (r.status == true) {
            return ShowOrdersSuccessState(orderEntity: r.orderData!);
          } else {
            return HomeErrorState(message: r.toString());
          }
        }));
      }

      if (event is ShowStaffOrdersEvent) {
        emit(HomeLoadingState());
        var result =
            await showStaffOrdersUsecase.call(event.start_at, event.end_at);
        emit(result.fold(
            (l) => HomeErrorState(
                message: l is ConnectionFailure
                    ? 'يرجى التأكد من الاتصال بالانترنت'
                    : 'لا يوجد طلبات لعرضها'), (r) {
          orderEntity = r;
          orderEntity.orderData = r.orderData;
          if (r.status == true) {
            return ShowStaffOrdersSuccessState(orderEntity: r.orderData!);
          } else {
            return HomeErrorState(message: r.toString());
          }
        }));
      }

      if (event is DatePickedEvent) {
        final formattedDate = DateFormat('yyyy-MM-dd').format(event.pickedDate);
        dateController.text = formattedDate;
        emit(StartDatePickedState(dateController.text));
      }
      if (event is StartDatePickedEvent) {
        final formattedDate = DateFormat('yyyy-MM-dd').format(event.pickedDate);
        startDateController.text = formattedDate;
        emit(StartDatePickedState(startDateController.text));
      }
      if (event is EndDatePickedEvent) {
        final formattedDate = DateFormat('yyyy-MM-dd').format(event.pickedDate);
        endDateController.text = formattedDate;
        emit(StartDatePickedState(endDateController.text));
      }
      if(event is StaffLogOutEvent){
        SharedPrefs.removeData(key: 'token');
        emit(AuthLogOutState());
      }
 if(event is LogOutEvent){
        SharedPrefs.removeData(key: 'driver_token');
        emit(AuthLogOutState());
      }


    });
  }

  @override
  close() async {
    super.close();
    dateController.dispose();
    discreptionController.dispose();
    staffsController.dispose();
    startDateController.clear();
    endDateController.clear();
  }
}
