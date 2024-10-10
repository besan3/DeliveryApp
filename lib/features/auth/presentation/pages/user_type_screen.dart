import 'package:delivery/core/app_sizes.dart';
import 'package:delivery/core/extentions/add_seperator_extention.dart';
import 'package:delivery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_routes.dart';
import '../../../../core/app_texts.dart';
import '../../../../core/app_widgets.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}
class _UserTypeScreenState extends State<UserTypeScreen>{
  int selectedIndex=0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc,AuthState>(
        listener: (context,state){
          if (state is AuthErrorState) {
            Fluttertoast.showToast(msg: state.message, textColor: Colors.white);
          }
          if(state is AuthSuccessState){

            Navigator.pushReplacementNamed(context, AppRoutes.staffHome);
            authBloc.emailController.clear();
            authBloc.passController.clear();
          }
          if(state is DriverAuthSuccessState){

            Navigator.pushReplacementNamed(context, AppRoutes.home);
            authBloc.driverNoController.clear();
            authBloc.driverPassController.clear();

          }        },
        builder: (context,state)=>
   Directionality(textDirection: TextDirection.rtl, child:      Scaffold(

       body:SingleChildScrollView(
         child:SafeArea(
           child:  Padding(padding:EdgeInsets.all(AppSizes.padding20.h.w),
             child:Form(
               key: formKey,
               child:

               Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                  SizedBox(height: 30.h,),

                     Text(
                       'أهلا بك في مكتب أجوان  ',
                       style: TextStyle(
                           fontFamily:AppTexts.fontFamily,
                           fontSize: AppSizes.fontSize24.sp,
                           fontWeight: FontWeight.w700,
                           color: AppColors.textPrimaryColor
                       ),
                       textAlign: TextAlign.center,
                     ),
                     Text(
                       'يرجى تحديد نوع المستخدم لتسجيل الدخول',
                       style: TextStyle(
                         fontFamily:AppTexts.fontFamily,
                         fontSize: AppSizes.fontSize16.sp,
                         fontWeight: FontWeight.w600,
                         color: AppColors.subTitleColor,
                       ),
                       textAlign: TextAlign.center,
                     ),
                     SizedBox(
                       height: 100.h,
                       width: double.infinity,
                       child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 selectedIndex=0;
                               });
                             },
                             child: Container(
                               width:140.w,
                               height: 80.h,
                               padding: EdgeInsets.all( AppSizes.padding20.h.w),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(AppSizes.radius15.r),
                                   border: Border.all(
                                       color:   selectedIndex==0?AppColors.primaryColor:AppColors.hintColor.withOpacity(0.3)

                                   )
                               ),
                               child:
                               Center(
                                 child: Text("موظف",
                                   style: selectedIndex==0? TextStyle(
                                       fontFamily:AppTexts.fontFamily,
                                       fontSize: AppSizes.fontSize20.sp,
                                       fontWeight: FontWeight.w700,
                                       color: AppColors.textPrimaryColor
                                   ):TextStyle(
                                     fontFamily:AppTexts.fontFamily,
                                     fontSize: AppSizes.fontSize16.sp,
                                     fontWeight: FontWeight.w600,
                                     color: AppColors.subTitleColor,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 selectedIndex=1;
                               });
                             },
                             child: Container(
                               width:140.w,
                               height: 80.h,
                               padding: EdgeInsets.all( AppSizes.padding20.h.w),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(AppSizes.radius15.r),
                                   border: Border.all(
                                       color:   selectedIndex==1?AppColors.primaryColor:AppColors.hintColor.withOpacity(0.3)

                                   )
                               ),
                               child: Center(
                                 child: Text('سائق',
                                   style:selectedIndex==1?TextStyle(
                                       fontFamily:AppTexts.fontFamily,
                                       fontSize: AppSizes.fontSize20.sp,
                                       fontWeight: FontWeight.w700,
                                       color: AppColors.textPrimaryColor
                                   ):TextStyle(
                                     fontFamily:AppTexts.fontFamily,
                                     fontSize: AppSizes.fontSize16.sp,
                                     fontWeight: FontWeight.w600,
                                     color: AppColors.subTitleColor,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                     selectedIndex==0?
                     Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           BuildTextField(labelText: AppTexts.email,
                               controller: authBloc.emailController,
                               hintText: 'email@example.com',
                               inputType: TextInputType.emailAddress,
                               isSecure: false,                           isLabel: true,
                           ),
                           BuildTextField(labelText: AppTexts.password,
                               controller: authBloc.passController,
                               hintText: '******',
                               inputType: TextInputType.visiblePassword,
                               isSecure: true,                           isLabel: true,
                           ),

                           CustomAppButton(
                             isText: false,
                             onPressed: ()async{
                               if(formKey.currentState!.validate()) {

                                 authBloc.add(LoginEvent(email:  authBloc.emailController.text,password:  authBloc. passController.text));
                               }
                             },

                             widget:state is AuthLoadingState?const Center(child: CircularProgressIndicator()): Text(AppTexts.logIn,style:TextStyle(
                               fontFamily:AppTexts.fontFamily,
                               fontSize: AppSizes.fontSize16.sp,
                               fontWeight: FontWeight.w500,
                               color: AppColors.backgroundColor,
                             ),),



                           )
                         ].addSeparator(separator: SizedBox(height: AppSizes.padding18.h,))
                     )
                         :  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         BuildTextField(labelText:'رقم السائق',
                             controller: authBloc.driverNoController,
                             hintText: '0000',
                             inputType: TextInputType.number,
                             isSecure: false,
                           isLabel: true,

                         ),
                         BuildTextField(labelText: AppTexts.password,
                             controller: authBloc.driverPassController,
                             hintText: '******',
                             inputType: TextInputType.visiblePassword,
                             isSecure: true,
                           isLabel: true,


                         ),

                         CustomAppButton(
                           isText: false,
                           onPressed: ()async{
                             if(formKey.currentState!.validate()) {

                               authBloc.add(DriverLoginEvent(driver_No:  authBloc.driverNoController.text,password:  authBloc. driverPassController.text));
                             }
                           },

                           widget:state is AuthLoadingState?const Center(child: CircularProgressIndicator()): Text(AppTexts.logIn,style:TextStyle(
                             fontFamily:AppTexts.fontFamily,
                             fontSize: AppSizes.fontSize16.sp,
                             fontWeight: FontWeight.w500,
                             color: AppColors.backgroundColor,
                           ),),

                         )
                       ].addSeparator(separator: SizedBox(height: AppSizes.padding18.h,)),


                     )
                   ].addSeparator(separator:SizedBox(height: AppSizes.padding18.h,))
               ),),
           ),
         )
       )
   ))

    );
  }
}

