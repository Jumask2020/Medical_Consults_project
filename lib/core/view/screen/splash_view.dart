import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_consult_project/core/view/screen/auth/signin.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';

import '../../../helper/storge_helper.dart';
import '../../constant/app_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    checkUser(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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



  }

  checkUser(BuildContext context)async {
    Future.delayed(Duration(seconds: 4),() {
      StorgeHelper s = StorgeHelper.instance;
      if(s.readKey('token')==null) {
        Navigator.pushNamedAndRemoveUntil(context, "/signin", (route) => false);
      }else {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      }
      }

    );
  }
}
