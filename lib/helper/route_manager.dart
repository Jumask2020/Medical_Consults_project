import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/screen/add_profile_view.dart';
import 'package:medical_consult_project/core/view/screen/auth/signin.dart';
import 'package:medical_consult_project/core/view/screen/auth/signup_view.dart';
import 'package:medical_consult_project/core/view/screen/splash_view.dart';

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
        );
    }
    return null;
  }
}
