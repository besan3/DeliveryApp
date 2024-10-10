import 'package:delivery/core/app_routes.dart';
import 'package:delivery/core/app_themes.dart';
import 'package:delivery/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_sizes.dart';
import 'core/network/local_storage.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SharedPrefs().init();
  SystemChrome.setPreferredOrientations( [DeviceOrientation.portraitUp ])
  ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(AppSizes.screenWidth, AppSizes.screenHeight),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
    return MultiBlocProvider(
    providers: [
    BlocProvider(
    create: (_) => di.sl<AuthBloc>(),
    ),
      BlocProvider(
    create: (_) => di.sl<HomeBloc>(),
    ),

    ],
    child:const MaterialApp(

      debugShowCheckedModeBanner: false,
      onGenerateRoute:AppRoutes.generateRoute,
      initialRoute:  AppRoutes.splash,
    )
    );}
    );
  }
}

