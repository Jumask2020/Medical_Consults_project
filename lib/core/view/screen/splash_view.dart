import 'package:flutter/material.dart';

import '../../constant/app_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          color: AppColor.secondaryColor,
        ),
      ),
    );
  }
}
