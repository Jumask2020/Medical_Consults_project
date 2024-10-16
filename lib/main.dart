import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/screen/splash_view.dart';
import 'package:medical_consult_project/core/view/screen/test.dart';
import 'package:medical_consult_project/core/view/widget/app_scaffold.dart';
import 'package:medical_consult_project/helper/network_service_helper.dart';
import 'package:medical_consult_project/helper/route_manager.dart';
import 'package:provider/provider.dart';

import 'helper/http_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale('ar'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: false,
      ),
      initialRoute: '/splash',
      onGenerateRoute: RouteManager.routeMangaer,
      // home: const AppScaffold(child: SplashView()),
    );
  }
}
