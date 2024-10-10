import 'package:delivery/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../core/app_sizes.dart';
import '../core/app_texts.dart';
import '../core/network/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var isLogged = SharedPrefs.getDta(key: 'token');
    var isDriverLogged = SharedPrefs.getDta(key: 'driver_token');



    Future.delayed(const Duration(seconds: 5), () {

      if(isDriverLogged!=null){
        Navigator.pushReplacementNamed(
            context,AppRoutes.home);
      }else if(isLogged!=null){
        Navigator.pushReplacementNamed(
            context,AppRoutes.staffHome);
      }
      else {
        Navigator.pushReplacementNamed(
            context,AppRoutes.login);
      }


    });

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo,width: 100.w,height: 130.h,),
            Text('مكتب أجوان',style: TextStyle(
                fontFamily:AppTexts.fontFamily,
                fontSize: AppSizes.fontSize24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimaryColor
            ),)
         ]
        )
      ),
    );
  }
}