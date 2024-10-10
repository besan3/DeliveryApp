
import 'package:delivery/features/auth/presentation/pages/user_type_screen.dart';
import 'package:delivery/features/home/presentation/pages/add_order_screen.dart';
import 'package:delivery/features/home/presentation/pages/home_screen.dart';
import 'package:delivery/features/home/presentation/pages/staff_home_screen.dart';
import 'package:flutter/material.dart';

import '../features/splash_screen.dart';

class AppRoutes {
   static const String splash = '/splash';
  static const String login = '/login';
   static const String addOrder = '/addOrder';
   static const String home = '/home';
   static const String staffHome = '/staffHome';
   static Route<dynamic> generateRoute(RouteSettings settings) {
     switch (settings.name) {
       case splash:
         return MaterialPageRoute(builder: (_) => const SplashScreen());
       case login:
         return MaterialPageRoute(builder: (_) => const UserTypeScreen());
       case addOrder:
         return MaterialPageRoute(builder: (_) => AddOrderScreen());
       case home:
         return MaterialPageRoute(builder: (_) => HomeScreen());
         case staffHome:
         return MaterialPageRoute(builder: (_) => StaffHomeScreen());

       default:
        return MaterialPageRoute(
           builder: (_) => Scaffold(
               body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
   }
  }

 }
