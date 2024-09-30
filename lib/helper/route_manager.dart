import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/screen/consults/consult_details_view.dart';
import 'package:medical_consult_project/core/view/screen/consults/new_consults_view.dart';
import 'package:medical_consult_project/core/view/screen/profile/add_profile_view.dart';
import 'package:medical_consult_project/core/view/screen/auth/signin.dart';
import 'package:medical_consult_project/core/view/screen/auth/signup_view.dart';
import 'package:medical_consult_project/core/view/screen/profile/display_profile_view.dart';
import 'package:medical_consult_project/core/view/screen/splash_view.dart';

import '../core/view/screen/consults/chatting_view.dart';

class RouteManager {
  static Route<dynamic>? routeMangaer(RouteSettings route) {
    switch (route.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (context) => const SigninView(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );
        case '/addProfile':
        return MaterialPageRoute(
          builder: (context) =>  AddProfileView(),
        ); case '/displayProfile':
        return MaterialPageRoute(
          builder: (context) =>  DisplayProfileView(),
        ); case '/newConsults':
        return MaterialPageRoute(
          builder: (context) =>  NewConsults(),
        );case '/consultDetails':
        return MaterialPageRoute(
          builder: (context) =>  ConsultDetails(),
        );case '/chatting':
        return MaterialPageRoute(
          builder: (context) =>  Chatting(),
        );
    }
    return null;
  }
}
