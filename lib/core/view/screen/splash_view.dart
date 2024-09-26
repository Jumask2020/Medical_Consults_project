import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_consult_project/core/view/screen/auth/signin.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';

import '../../constant/app_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7),() {
      Navigator.pushNamedAndRemoveUntil(context, "/signin", (route) => false);
    },
    );
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child:
              Lottie.asset("assets/lottie/Animation - 1727322566962.json")),
          Text("تطبيق الاستشارات الطبية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "LBC",color: AppColor.primaryColor),),
          MyVerticalSize(),
          Text("يرجى الإنتظار  ...",style: TextStyle(fontFamily: "LBC",color: AppColor.primaryColor),),
        ],
      ),
    );
    //   AnimatedSplashScreen(
    //     splash: Container(
    //       height: MediaQuery.of(context).size.height-288,
    //       child:
    //       Column(
    //         children: [
    //           Center(
    //               child: LottieBuilder.asset("assets/lottie/Animation - 1727322566962.json")),
    //         ],
    //       ),
    //     )
    //     , nextScreen: SigninView(),
    //   backgroundColor: AppColor.primaryColor,
    //   //animationDuration: Duration(seconds: 30),
    //
    // );


    //   Scaffold(
    //   backgroundColor: AppColor.primaryColor,
    //   body: Center(
    //     child: Image.asset(
    //       'assets/images/logo.png',
    //       color: AppColor.secondaryColor,
    //     ),
    //   ),
    // );
  }
}
