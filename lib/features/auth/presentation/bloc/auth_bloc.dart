
import 'package:bloc/bloc.dart';
import 'package:delivery/core/network/local_storage.dart';
import 'package:delivery/features/auth/domain/entites/driver_login_entity.dart';
import 'package:delivery/features/auth/domain/entites/login_entity.dart';
import 'package:delivery/features/auth/domain/usecases/driver_login_usecase.dart';
import 'package:delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:delivery/core/errors/fauilers.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();
  final TextEditingController driverPassController=TextEditingController();
  final TextEditingController driverNoController=TextEditingController();
  final LoginUseCase loginUseCase;
  final DriverLoginUseCase driverLoginUseCase;
   LoginEntity loginEntity=LoginEntity( token: '', user: UserEntity(id: 0, name: '', email: '', createdAt: DateTime(0), updatedAt: DateTime(0), profilePhotoUrl: ''));
    DriverLoginEntity driverLoginEntity=DriverLoginEntity(token: '',
        driver: DriverEntity(id: 0, name: '', Car_type: '', password: '', driver_No: 0, createdAt: DateTime(0), updatedAt: DateTime(0), profilePhotoUrl: ''));



    AuthBloc({required this.loginUseCase,required this.driverLoginUseCase}) : super(AuthInitial()){
  on<AuthEvent>((event, emit) async {
    if (event is LoginEvent) {
      emit(AuthLoadingState());
      var result = await loginUseCase.call(event.email, event.password);

      emit(result.fold((l) => AuthErrorState(message:l is ConnectionFailure?'يرجى التأكد من الاتصال بالانترنت': 'تأكد من البريد الالكتروني و كلمة المرور'), (r) {
        loginEntity = r;
        if(r.token.isNotEmpty) {
          return AuthSuccessState(loginEntity: loginEntity);}
        else{
          return AuthErrorState(message:r.toString());
        }
      }));
    }
    if (event is DriverLoginEvent) {
      emit(AuthLoadingState());
      var result = await driverLoginUseCase.call(event.driver_No, event.password);

      emit(result.fold((l) => AuthErrorState(message:l is ConnectionFailure?'يرجى التأكد من الاتصال بالانترنت': l is FirebaseFailure?'رقم السائق غير صحيح ':l.toString()), (r) {
        driverLoginEntity = r;
        if(r.token.isNotEmpty) {
          return DriverAuthSuccessState(loginEntity: driverLoginEntity);}
        else{
          return AuthErrorState(message:r.toString());
        }
      }));
    }
    if (event is ToggleUserTypeEvent) {
      emit(UserTypeSelected(userType: event.userType));
    }


  });


}
}
